
#include "char-table.h"

// char
#define char_len_0(_, c) ((3, len_to_char_ ## c))
#define char_len_1(n, c) CALL(char_len, 1##c, n)
#define char_len_splat(n, ...) char_len_ ## n(__VA_ARGS__

#define M_char_len char_len
#define char_len(c, n) char_len_splat n, c)

#define M_eb_char eb_char
#define eb_char(c, n) char_len_splat n, 0)

// empty
#define M_eb_empty eb_empty
#define eb_empty(a, d, c) ((3))

// token
#define M_token_rec_2x token_rec_2x
#define token_rec_2x(a, d, c) CALL(token_rec, c ## a, d)

#define token_rec_0(_, c) ((3, c))
#define token_rec_2(a, d, c) CALL(token_rec_2x, OP_TUPLE_1 a, d, c)
#define token_rec_splat(n, ...) token_rec_ ## n(__VA_ARGS__

#define M_token_rec token_rec
#define token_rec(c, n) token_rec_splat n, c)

#define M_eb_token eb_token
#define eb_token(c, n) token_rec_splat n, )

// jux
#define M_eb_jux eb_jux
#define eb_jux(c, a, b) ((3, OP_TUPLE_TAIL a OP_TUPLE_TAIL b))

// commajux
#define M_eb_commajux eb_commajux
#define eb_commajux(c, a, b) ((3, OP_TUPLE_TAIL a, OP_TUPLE_TAIL b))

// tostr
#define tostr_splat(n, v) #v
#define M_eb_tostr eb_tostr
#define eb_tostr(c, t) ((3, tostr_splat t))

#include "int-table.h"

#define INVOKE_0(f) EXP5(OP_TUPLE_TAIL SPLAT eb_ ## f(_))
#define INVOKE_1(f, n) EXP5(OP_TUPLE_TAIL SPLAT eb_ ## f(_, int_ ## n))
#define INVOKE_2(f, n, m) EXP5(OP_TUPLE_TAIL SPLAT eb_ ## f(_, int_ ## n, int_ ## m))
