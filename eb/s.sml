
signature BASE = sig
  type t
  type 'a F
  val fmap : ('a -> 'b) -> 'a F -> 'b F   (* F is a category theory functor *)
  val prj  : t -> t F                     (* Recursive   *)
  val inj  : t F -> t                     (* Corecursive *)
end

functor Schemes(structure T : BASE) : sig
  structure T  : BASE

  val cata     : (        'a T.F -> 'a) -> T.t -> 'a                (* tears down a structure level by level *)
  val ana      : ('a ->                        'a T.F) -> 'a -> T.t (* builds up a structure level by level *)
  val hylo     : ('a T.F -> 'a) -> ('b -> 'b T.F) -> 'b -> 'a       (* builds up and tears down a virtual structure *)

  val para     : ((T.t * 'a) T.F -> 'a) -> T.t -> 'a                (* tears down a structure with primitive recursion *)
  val apo      : ('a -> ((T.t, 'a) Either.either) T.F) -> 'a -> T.t (* builds up a structure opting to return a single level or an entire branch at each point *)


  (* val accumulation : ('x T.F -> 'p -> 'a) -> T.t -> 'p -> 'a        Recursion with an accumulating parameter *)

end = struct

  fun id x = x
  fun case_either x y = Either.proj o Either.map (x, y)

  structure T = T
  open T

  fun cata step x = (step o fmap (cata step) o prj) x
  fun para step x = (step o fmap (fn y => (y, para step y)) o prj) x

  fun ana  gen  x = (inj  o fmap (ana  gen ) o gen) x
  fun apo  gen  x = (inj  o fmap ( case_either id (apo gen) ) o gen) x

  fun hylo step gen x = (step o fmap ( hylo step gen ) o gen) x


  (* fun accumulation f g x acc *)


end






structure Z = struct
  datatype     tree = NODE  of int * tree list
  datatype 'a fTree = FNODE of int *   'a list

  structure TreeSchemes = Schemes(structure T = struct
    type t = tree
    type 'a F = 'a fTree
    fun fmap f (FNODE (n,  l)) = FNODE (n, List.map f l)
    val prj = fn NODE  (n, l) => FNODE (n, l)
    val inj = fn FNODE (n, l) => NODE  (n, l)
  end)


  datatype 'a fTreeZip = FNIL | FCONS of (tree * tree) * 'a
  structure TreeZipSchemes =  
  (* struct *)
  Schemes(
    structure T = struct
    type t = (tree * tree) list
    type 'a F = 'a fTreeZip
    fun fmap _ FNIL = FNIL
      | fmap f (FCONS (x, l)) = FCONS (x, f l)
    val prj = fn []        => FNIL
               | (x :: xs) => FCONS (x, xs)
    val inj = fn FNIL => []
               | FCONS (x, xs) => x::xs
  end)

  val _ = let
    fun node  n l = NODE (n, l)
    fun fnode n l = FNODE(n, l)

    val show_tree = TreeSchemes.cata 
      (fn FNODE (n, l) => "NODE(" ^ Int.toString n  ^ ", [" ^ List.foldr (op ^) "" l ^ "]) " )

    fun insert_left_most new = TreeSchemes.para
      (fn FNODE (i, []) => node i [node new []]
      |   FNODE (i, ((_, recur) :: tts)) => 
          let
            val unzip = TreeZipSchemes.cata (fn FNIL                    => ([],[]) 
                |                               FCONS ((l,r), (ls, rs)) => (l::ls, r::rs))
          in
            node i (recur :: (#1 o unzip) tts)
          end
      )

    val myTree =  node 0 [
                    node 1 [], 
                    node 2 [], 
                    node 3 [
                      node 31 [
                        node 311 [
                          node 3111 [],
                          node 3112 []
                  ]]]]
 in (print o show_tree o insert_left_most 999) myTree end
end 

val _ = OS.Process.exit OS.Process.success