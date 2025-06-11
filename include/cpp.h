
#define EQUAL_00 1
#define EQUAL_11 1

#define ABOVE_00 0
#define ABOVE_01 0
#define ABOVE_10 1
#define ABOVE_11 0

#define COMMA() ,
    
#define FST(a,...) a

#define RST(a,...) __VA_ARGS__

#define SND_(a, b, ...) b
#define SND(...)SND_(__VA_ARGS__,,)

#define T(a, b) a
#define F(a, b) b

#define IS_PAREN_() IS_PAREN_ 
#define IS_PAREN(a) SND(COMMA a T, F)

#define IS_SPACE(a) IS_PAREN(a) (F, SND(COMMA a () T, F))

#define DEL(...)
#define SPLAT(...)__VA_ARGS__

#define CAT(a, b) a ## b
#define CALL(f, ...) CAT DEL () (M_, f) (__VA_ARGS__)
#define CALL_SPLAT(f, ...) CAT DEL () (M_, f) __VA_ARGS__

#define EXP(...)__VA_ARGS__
#define EXP1(...)EXP(EXP(EXP(EXP(EXP(EXP(EXP(EXP(__VA_ARGS__))))))))
#define EXP2(...)EXP1(EXP1(EXP1(EXP1(EXP1(EXP1(EXP1(EXP1(__VA_ARGS__))))))))
#define EXP3(...)EXP2(EXP2(EXP2(EXP2(EXP2(EXP2(EXP2(EXP2(__VA_ARGS__))))))))

#define CONS_(b) b)
#define CONS(a) (a, CONS_
#define ROTL(a, ...) (__VA_ARGS__, a)
#define CCONS__(a, b) (SPLAT a, SPLAT b)
#define CCONS_(...) (__VA_ARGS__))
#define CCONS(...) CCONS__ ROTL DEL() ((__VA_ARGS__), CCONS_

#define TYPE_ZERO 0
#define TYPE_SUCC 1
#define TYPE_CONS 2

#define BIT_EQUAL(a, b) EQUAL_##a##b
#define BIT_ABOVE(a, b) ABOVE_##a##b

#define OP_TUPLE_0(v0, ...) v0
#define OP_TUPLE_1(v0, v1, ...) v1
#define OP_TUPLE_2(v0, v1, v2, ...) v2
#define OP_TUPLE_3(v0, v1, v2, v3, ...) v3
#define OP_TUPLE_4(v0, v1, v2, v3, v4, ...) v4
#define OP_TUPLE_5(v0, v1, v2, v3, v4, v5, ...) v5
#define OP_TUPLE_6(v0, v1, v2, v3, v4, v5, v6, ...) v6
#define OP_TUPLE_7(v0, v1, v2, v3, v4, v5, v6, v7, ...) v7
#define OP_TUPLE_8(v0, v1, v2, v3, v4, v5, v6, v7, v8, ...) v8

#define if_true(a, b) a
#define if_false(a, b) b

#define if_0() if_false
#define if_1(a) if_true
#define if_2(a, b) if_true
#define if_splat(n, ...) if_ ## n(__VA_ARGS__)
#define M_eb_if eb_if
#define eb_if(v, c, t, f) CALL if_splat c(t, f))

#define M_eb_cons eb_cons
#define eb_cons(v, car, cdr) ((TYPE_CONS, car, cdr))

#define M_eb_car eb_car
#define eb_car(v, ls) (OP_TUPLE_1 ls)

#define M_eb_cdr eb_cdr
#define eb_cdr(v, ls) (OP_TUPLE_2 ls)

#define FINAL(d) d

#if !defined(RUN)
#define RUN() EXP3(FINAL eb_main(_, _))
#endif
