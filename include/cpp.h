
#define DEL(...)
#define SPLAT(...)__VA_ARGS__

#define CAT(a, b) a ## b
#define CALL(f, ...) CAT DEL () (M_, f) (__VA_ARGS__)

#define ROTL(a, ...) (__VA_ARGS__, a)
#define CCONS__(a, b) (SPLAT a, SPLAT b)
#define CCONS_(...) (__VA_ARGS__))
#define CCONS(...) CCONS__ ROTL DEL() ((__VA_ARGS__), CCONS_

#define OP_TUPLE_TAIL(x, ...) __VA_ARGS__

#define OP_TUPLE_0(v0, ...) v0
#define OP_TUPLE_1(v0, v1, ...) v1
#define OP_TUPLE_2(v0, v1, v2, ...) v2
#define OP_TUPLE_3(v0, v1, v2, v3, ...) v3
#define OP_TUPLE_4(v0, v1, v2, v3, v4, ...) v4
#define OP_TUPLE_5(v0, v1, v2, v3, v4, v5, ...) v5
#define OP_TUPLE_6(v0, v1, v2, v3, v4, v5, v6, ...) v6
#define OP_TUPLE_7(v0, v1, v2, v3, v4, v5, v6, v7, ...) v7
#define OP_TUPLE_8(v0, v1, v2, v3, v4, v5, v6, v7, v8, ...) v8

#define if_0(t, f) CALL (OP_TUPLE_0 f, f)
#define if_1(t, f) CALL (OP_TUPLE_0 t, t)
#define if_2(t, f) CALL (OP_TUPLE_0 t, t)
#define if_splat(n, ...) if_ ## n(
#define M_eb_if eb_if
#define eb_if(v, c, t, f) if_splat c t, f)

#define M_eb_cons eb_cons
#define eb_cons(v, car, cdr) ((2, car, cdr))

#define M_eb_car eb_car
#define eb_car(v, ls) (OP_TUPLE_1 ls)

#define M_eb_cdr eb_cdr
#define eb_cdr(v, ls) (OP_TUPLE_2 ls)

#define pred_1(o, v) v
#define M_eb_pred eb_pred
#define eb_pred(v, n) (pred_1 n)

#define M_eb_succ eb_succ
#define eb_succ(v, n) ((1, n))

#define EXP0(...)__VA_ARGS__
#define EXP1(...)EXP0(EXP0(EXP0(EXP0(EXP0(EXP0(EXP0(EXP0(__VA_ARGS__))))))))
#define EXP2(...)EXP1(EXP1(EXP1(EXP1(EXP1(EXP1(EXP1(EXP1(__VA_ARGS__))))))))
#define EXP3(...)EXP2(EXP2(EXP2(EXP2(EXP2(EXP2(EXP2(EXP2(__VA_ARGS__))))))))
#define EXP4(...)EXP3(EXP3(EXP3(EXP3(EXP3(EXP3(EXP3(EXP3(__VA_ARGS__))))))))
#define EXP5(...)EXP4(EXP4(EXP4(EXP4(EXP4(EXP4(EXP4(EXP4(__VA_ARGS__))))))))

#if !defined(RUN)
#define RUN EXP4(FINAL eb_main(_, _))
#endif

#if defined(EMIT_CONS)

#define ZERO 0
#define PRE_INC
#define POST_INC + 1
#define PRE_CONS &(cons_t) {(void *) (
#define MID_CONS ), (void *) (
#define POST_CONS )}

typedef struct cons_t cons_t;

struct cons_t {
    cons_t *car;
    cons_t *cdr;
};

#elif defined(EMIT_DATA)

#define ZERO 0
#define PRE_INC (1,
#define POST_INC )
#define PRE_CONS (2,
#define MID_CONS ,
#define POST_CONS )

#else

#define ZERO 0
#define PRE_INC (1,
#define POST_INC )
#define PRE_CONS (2,
#define MID_CONS ,
#define POST_CONS )

#endif

#define FINAL_ZERO() ZERO
#define FINAL_INC(n) PRE_INC CALL(FINAL, n) POST_INC
#define FINAL_CONS(a, b) PRE_CONS CALL(FINAL, a) MID_CONS CALL(FINAL, b) POST_CONS

#define FINAL_0 FINAL_ZERO(
#define FINAL_1 FINAL_INC(
#define FINAL_2 FINAL_CONS(

#define FINAL_n(n, ...) CAT(FINAL_, n) __VA_ARGS__)

#define M_FINAL FINAL
#define FINAL(d) FINAL_n d

