#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static uint8_t ebz_mem[1 << 28];
static uint8_t *ebz_alloc_mem = &ebz_mem[0];
static size_t ebz_alloc_head = 0;
static size_t ebz_alloc_alloc = 0;
static inline void *ebz_alloc_bytes(size_t size) {
    size_t head = ebz_alloc_head;
    ebz_alloc_head += size;
    return &ebz_mem[head];
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
    uint8_t buf[16];
    size_t size = 1;
    uint8_t tag = 0;
    if (b <= UINT8_MAX) {
        tag += EBZ_TAG_B1;
        uint8_t v = b;
        memcpy(&buf[size], &v, 1);
        size += 1;
    } else if (b <= UINT16_MAX) {
        tag += EBZ_TAG_B2;
        uint16_t v = b;
        memcpy(&buf[size], &v, 2);
        size += 2;
    } else if (b <= UINT32_MAX) {
        tag += EBZ_TAG_B4;
        uint32_t v = b;
        memcpy(&buf[size], &v, 4);
        size += 4;
    } else {
        tag += EBZ_TAG_PTR;
        ptrdiff_t diff = (uint8_t *) b - &ebz_mem[0];
        printf("b = (ptr %zi)\n", diff);
        uint32_t v =  (uint32_t) diff;
        memcpy(&buf[size], &v, 4);
        size += 4;
    }
    tag *= EBZ_TAG_MAX;
    if (a < UINT8_MAX) {
        tag += EBZ_TAG_B1;
        uint8_t v = a;
        memcpy(&buf[size], &v, 1);
        size += 1;
    } else if (a < UINT16_MAX) {
        tag += EBZ_TAG_B2;
        uint16_t v = a;
        memcpy(&buf[size], &v, 2);
        size += 2;
    } else if (a < UINT32_MAX) {
        tag += EBZ_TAG_B4;
        uint32_t v = a;
        memcpy(&buf[size], &v, 4);
        size += 4;
    } else {
        tag += EBZ_TAG_PTR;
        ptrdiff_t diff = (uint8_t *) a - &ebz_mem[0];
        printf("a = (ptr %zi)\n", diff);
        uint32_t v =  (uint32_t) diff;
        memcpy(&buf[size], &v, 4);
        size += 4;
    }
    buf[0] = tag;
    size_t head = ebz_alloc_head;
    ebz_alloc_head += size;
    uint8_t *ret = &ebz_mem[head];
    memcpy(ret, buf, size);
    printf("tag(cons => %p+%zu) = %zu :: %zu\n", ret, size, (size_t) tag % EBZ_TAG_MAX, (size_t) tag / EBZ_TAG_MAX % EBZ_TAG_MAX);
    return (size_t) ret;
}
static inline size_t ebz_first(size_t p) {
    uint8_t *buf = (uint8_t *)p;
    uint8_t tag = *buf++;
    printf("tag(first %p) = %zu :: %zu\n", (void *)p, (size_t) tag % EBZ_TAG_MAX, (size_t) tag / EBZ_TAG_MAX % EBZ_TAG_MAX);
    if (tag % EBZ_TAG_MAX == EBZ_TAG_B1) {
        uint8_t ret;
        memcpy(&ret, buf, 1);
        return (size_t) ret;
    }
    if (tag % EBZ_TAG_MAX == EBZ_TAG_B2) {
        uint16_t ret;
        memcpy(&ret, buf, 2);
        return (size_t) ret;
    }
    if (tag % EBZ_TAG_MAX == EBZ_TAG_B4) {
        uint32_t ret;
        memcpy(&ret, buf, 4);
        return (size_t) ret;
    }
    if (tag % EBZ_TAG_MAX == EBZ_TAG_PTR) {
        uint32_t offset;
        memcpy(&offset, buf, 4);
        return (size_t) &ebz_mem[offset];
    }
    __builtin_trap();
}
static inline size_t ebz_second(size_t p) {
    uint8_t *buf = (uint8_t *)p;
    uint8_t tag = *buf++;
    printf("tag(second %p) = %zu :: %zu\n", (void *)p, (size_t) tag % EBZ_TAG_MAX, (size_t) tag / EBZ_TAG_MAX % EBZ_TAG_MAX);
    printf("buf = %p\n", buf);
    if (tag % EBZ_TAG_MAX == EBZ_TAG_B1) {
        buf += 1;
    }
    if (tag % EBZ_TAG_MAX == EBZ_TAG_B2) {
        buf += 2;
    }
    if (tag % EBZ_TAG_MAX == EBZ_TAG_B4) {
        buf += 4;
    }
    if (tag % EBZ_TAG_MAX == EBZ_TAG_PTR) {
        buf += 4;
    }
    printf("buf = %p\n", buf);
    tag /= EBZ_TAG_MAX;
    if (tag % EBZ_TAG_MAX >= EBZ_TAG_B1) {
        uint8_t ret;
        memcpy(&ret, buf, 1);
        return (size_t) ret;
    }
    if (tag % EBZ_TAG_MAX >= EBZ_TAG_B2) {
        uint16_t ret;
        memcpy(&ret, buf, 2);
        return (size_t) ret;
    }
    if (tag % EBZ_TAG_MAX >= EBZ_TAG_B4) {
        uint32_t ret;
        printf("buf = %p\n", buf);
        memcpy(&ret, buf, 4);
        printf("ret = %zu\n", (size_t) ret);
        return (size_t) ret;
    }
    if (tag % EBZ_TAG_MAX >= EBZ_TAG_PTR) {
        uint32_t offset;
        memcpy(&offset, buf, 4);
        return (size_t) &ebz_mem[offset];
    }
    __builtin_trap();
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
    printf("alloc: %zu\n", ebz_alloc_head);
    return got;
}
