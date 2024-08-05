#include <stddef.h>
#include <stdio.h>
#include <stdint.h>

#if EB_DEBUG
#define EB_ENTER() ebz_enter(__FUNCTION__)
#define EB_EXIT() ebz_exit(__FUNCTION__)

size_t ebz_cur_depth = 0;
size_t ebz_max_depth = 0;

static inline void ebz_enter(const char *name) {
    ebz_cur_depth += 1;
    if (ebz_cur_depth > ebz_max_depth) {
        ebz_max_depth = ebz_cur_depth;
    }
}

static inline void ebz_exit(const char *name) {
    ebz_cur_depth -= 1;
}
#else
#define EB_ENTER() ((void) 0)
#define EB_EXIT() ((void) 0)
#endif

struct ebz_pair_t;
typedef struct ebz_pair_t ebz_pair_t;
struct ebz_pair_t {
  uint32_t first;
  uint32_t second;
};
static ebz_pair_t ebz_alloc_mem[1 << 24];
static size_t ebz_alloc_total = 1;
static inline size_t ebz_pair(size_t a, size_t b) {
    size_t ret = ebz_alloc_total++;
    ebz_alloc_mem[ret].first = a;
    ebz_alloc_mem[ret].second = b;
    return ret;
}
static inline size_t ebz_putchar(size_t c) {
    putchar((int)c);
    return 0;
}
static inline size_t ebz_first(size_t p) {
  return ebz_alloc_mem[p].first;
}
static inline size_t ebz_second(size_t p) {
  return ebz_alloc_mem[p].second;
}
static inline size_t ebz_if(size_t c, size_t t, size_t e) {
    if (c != 0) {
        return ((size_t(*)(size_t)) * (size_t *)t)(t);
    } else {
        return ((size_t(*)(size_t)) * (size_t *)e)(e);
    }
}
static inline size_t eb_putchar_ret(size_t a1, size_t a2);
static size_t eb_putchar[1] = {
  (size_t) eb_putchar_ret,
};
static inline size_t eb_putchar_ret(size_t a1, size_t a2) {
    return ebz_putchar(a2);
}
static inline size_t eb_cons_ret(size_t a1, size_t a2, size_t a3);
static size_t eb_cons[1] = {
  (size_t) eb_cons_ret,
};
static inline size_t eb_cons_ret(size_t a1, size_t a2, size_t a3) {
    return ebz_pair(a2, a3);
}
static inline size_t eb_car_ret(size_t a1, size_t a2);
static size_t eb_car[1] = {
  (size_t) eb_car_ret,
};
static inline size_t eb_car_ret(size_t a1, size_t a2) { return ebz_first(a2); }
static inline size_t eb_cdr_ret(size_t a1, size_t a2);
static size_t eb_cdr[1] = {
  (size_t) eb_cdr_ret,
};
static inline size_t eb_cdr_ret(size_t a1, size_t a2) { return ebz_second(a2); }
static inline size_t eb_if_ret(size_t a1, size_t a2, size_t a3, size_t a4);
static size_t eb_if[1] = {
  (size_t) eb_if_ret,
};
static inline size_t eb_if_ret(size_t a1, size_t a2, size_t a3, size_t a4) {
    return ebz_if(a2, a3, a4);
}
static inline size_t eb_add_ret(size_t a1, size_t r, size_t l);
static size_t eb_add[1] = {
  (size_t) eb_add_ret,
};
static inline size_t eb_add_ret(size_t a1, size_t r, size_t l) { return l + r; }
static inline size_t eb_sub_ret(size_t a1, size_t r, size_t l);
static size_t eb_sub[1] = {
  (size_t) eb_sub_ret,
};
static inline size_t eb_sub_ret(size_t a1, size_t r, size_t l) { return l - r; }
static inline size_t eb_mul_ret(size_t a1, size_t r, size_t l);
static size_t eb_mul[1] = {
  (size_t) eb_mul_ret,
};
static inline size_t eb_mul_ret(size_t a1, size_t r, size_t l) { return l * r; }
static inline size_t eb_div_ret(size_t a1, size_t r, size_t l);
static size_t eb_div[1] = {
  (size_t) eb_div_ret,
};
static inline size_t eb_div_ret(size_t a1, size_t r, size_t l) { return l / r; }
static inline size_t eb_mod_ret(size_t a1, size_t r, size_t l);
static size_t eb_mod[1] = {
  (size_t) eb_mod_ret,
};
static inline size_t eb_mod_ret(size_t a1, size_t r, size_t l) { return l % r; }
static inline size_t eb_equal_ret(size_t a1, size_t r, size_t l);
static size_t eb_equal[1] = {
  (size_t) eb_equal_ret,
};
static inline size_t eb_equal_ret(size_t a1, size_t r, size_t l) {
    return l == r ? 1 : 0;
}
static inline size_t eb_above_ret(size_t a1, size_t r, size_t l);
static size_t eb_above[1] = {
  (size_t) eb_above_ret,
};
static inline size_t eb_above_ret(size_t a1, size_t r, size_t l) {
    return r > l ? 1 : 0;
}
static inline void ebz_stol(size_t *exist, char *p) {
    if (*exist != 0) {
        return;
    }
    size_t r = 0;
    size_t len = 0;
    while (p[len] != '\0') {
        len += 1;
    }
    for (size_t i = len; i > 0; i--) {
        r = ebz_pair(p[i - 1], r);
    };
    *exist = r;
}
static inline size_t eb_read_DASH_file_ret(size_t a1, size_t f);
static size_t eb_read_DASH_file[1] = {
  (size_t) eb_read_DASH_file_ret,
};
static inline size_t eb_read_DASH_file_ret(size_t a1, size_t f) {
    char name[1024];
    char *s = name;
    while (f) {
        *s++ = ebz_first(f);
        f = ebz_second(f);
    }
    *s++ = 0;
    FILE *k = fopen(name, "r");
    if (k == NULL) {
      return 0;
    }
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
extern size_t eb_main[1];
int main(int argc, char **argv) {
    size_t a = 0;
    while (argc > 1) {
        char *c = argv[--argc];
        size_t next = 0;
        ebz_stol(&next, c);
        a = ebz_pair(next, a);
    }
    int got = ((size_t (*)(size_t, size_t)) eb_main[0])((size_t) eb_main, a);
#if EB_DEBUG
    fprintf(stderr, "// %zu pairs\n", ebz_alloc_total);
    fprintf(stderr, "// %zu depth\n", ebz_max_depth);
#endif
    return got;
}
