
#define IS_0_EQUAL_0
#define IS_1_EQUAL_1

#define IS_1_ABOVE_0

#define COMMA() ,

#define FST(a,...) a

#define RST(a,...) __VA_ARGS__

#define SND_(a, b, ...) b
#define SND(...)SND_(__VA_ARGS__,,)

//NOTE issues with blue paint
#define T(a, b) a
#define F(a, b) b

#define IS_PAREN_() IS_PAREN_ 
#define IS_PAREN(a) SND(COMMA a T, F)

#define IS_SPACE(a) IS_PAREN(a) (F, SND(COMMA a () T, F))

//blue point Avoidinator
#define DEL(...)
#define SPLAT(...)__VA_ARGS__

#define CAT(a, b) a ## b
#define CALL(f, ...) CAT DEL () (M_, f) (__VA_ARGS__)

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

#define OP_CONS(a, b) (a, b)
#define OP_CAR(a) FST a
#define OP_CDR(a) SND a

#define OP_EQUAL(a, b) IS_SPACE (CMP_##a##_EQUAL_##b)
#define OP_ABOVE(a, b) IS_SPACE (CMP_##a##_ABOVE_##_##b)

#define OP_TUPLE_0(v0, ...) v0
#define OP_TUPLE_1(v0, v1, ...) v1
#define OP_TUPLE_2(v0, v1, v2, ...) v2
#define OP_TUPLE_3(v0, v1, v2, v3, ...) v3
#define OP_TUPLE_4(v0, v1, v2, v3, v4, ...) v4
#define OP_TUPLE_5(v0, v1, v2, v3, v4, v5, ...) v5

#define M_eb_cons eb_cons
#define eb_cons(v, car, cdr) ((car, cdr))

#define M_eb_car eb_car
#define eb_car(v, ls) (FST ls)

#define M_eb_cdr eb_cdr
#define eb_cdr(v, ls) (FST ls)

#if !defined(RUN)
#define RUN(d) EXP3(SPLAT d)
#endif
