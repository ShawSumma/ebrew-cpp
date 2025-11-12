
/**
 * temper build -b py
 * python3 build.py example/gen-range.eb -o output.c.out
 * gcc -E -P example/gen-range.c
 */


#include "../output.c"
#include "../include/ebrew/cpp/char.h"

// const char *digits = INVOKE_2(char_range, 100, 7);
int ls[] = INVOKE_1(gen_fib, 5);

const char *x = INVOKE_0(hello);
