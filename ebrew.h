#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static size_t ebz_alloc_total = 0;
static inline void *ebz_alloc_bytes(size_t size) {
    ebz_alloc_total += size;
    return malloc(size);
}
static inline size_t *ebz_alloc(size_t n) {
    return ebz_alloc_bytes(sizeof(size_t) * n);
}
static inline size_t ebz_putchar(size_t c) {
    putchar((int)c);
    return 0;
}
enum {
    EBZ_TAG_B1 = 0,
    EBZ_TAG_B2 = 1,
    EBZ_TAG_B4 = 2,
    EBZ_TAG_PTR = 3,
    EBZ_TAG_MAX = 4,
};
static inline size_t ebz_pair(size_t a, size_t b) {
    size_t *pair = ebz_alloc(2);
    pair[0] = a;
    pair[1] = b;
    return (size_t) pair;
}
static inline size_t ebz_first(size_t p) {
    return ((size_t *)p)[0];
}
static inline size_t ebz_second(size_t p) {
    return ((size_t *)p)[1];
}
static inline size_t ebz_if(size_t c, size_t t, size_t e) {
    if (c) {
        return ((size_t(*)(size_t)) * (size_t *)t)(t);
    } else {
        return ((size_t(*)(size_t)) * (size_t *)e)(e);
    }
}
static inline size_t eb_putchar(size_t a1, size_t a2) {
    return ebz_putchar(a2);
}
static inline size_t eb_pair(size_t a1, size_t a2, size_t a3) {
    return ebz_pair(a2, a3);
}
static inline size_t eb_first(size_t a1, size_t a2) { return ebz_first(a2); }
static inline size_t eb_second(size_t a1, size_t a2) { return ebz_second(a2); }
static inline size_t eb_if(size_t a1, size_t a2, size_t a3, size_t a4) {
    return ebz_if(a2, a3, a4);
}
static inline size_t eb_add(size_t a1, size_t r, size_t l) { return l + r; }
static inline size_t eb_sub(size_t a1, size_t r, size_t l) { return l - r; }
static inline size_t eb_mul(size_t a1, size_t r, size_t l) { return l * r; }
static inline size_t eb_div(size_t a1, size_t r, size_t l) { return l / r; }
static inline size_t eb_mod(size_t a1, size_t r, size_t l) { return l % r; }
static inline size_t eb_equal(size_t a1, size_t r, size_t l) {
    return l == r ? 1 : 0;
}
static inline size_t eb_above(size_t a1, size_t r, size_t l) {
    return r > l ? 1 : 0;
}
static inline size_t ebz_stol(size_t *exist, char *p) {
    if (*exist == 0) {
        size_t r = 0;
        for (size_t i = strlen(p); i > 0; i--) {
            r = ebz_pair(p[i - 1], r);
        };
        *exist = r;
    }
    return *exist;
}
static inline size_t eb_read_DASH_file(size_t a1, size_t f) {
    char name[1024];
    char *s = name;
    while (f) {
        *s++ = ebz_first(f);
        f = ebz_second(f);
    }
    *s++ = 0;
    FILE *k = fopen(name, "r");
    static char i[1 << 20];
    char *m = i;
    while (!feof(k)) {
        char c = fgetc(k);
        if (c <= 0) {
            break;
        }
        *m++ = c;
    }
    *m++ = 0;
    fclose(k);
    size_t r = 0;
    ebz_stol(&r, i);
    return r;
}
size_t eb_main(size_t c, size_t a1);
int main(int argc, char **argv) {
    size_t a = 0;
    while (argc > 1) {
        char *c = argv[--argc];
        size_t next = 0;
        a = ebz_pair(ebz_stol(&next, c), a);
    }
    int got = (int)eb_main(0, a);
    // printf("alloc: %zu\n", ebz_alloc_total);
    return got;
}
