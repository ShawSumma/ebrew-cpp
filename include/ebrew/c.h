#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#if EB_DEBUG
size_t ebz_cur_depth = 0;
#endif

struct ebz_cons_t;
typedef struct ebz_cons_t ebz_cons_t;
struct ebz_cons_t {
  size_t car;
  size_t cdr;
};
size_t ebz_alloc_total = 0;
static inline size_t ebz_cons(size_t car, size_t cdr) {
  ebz_alloc_total += 1;
  ebz_cons_t *ret = malloc(sizeof(ebz_cons_t));
  ret->car = car;
  ret->cdr = cdr;
  return (size_t)ret;
}
static inline size_t ebz_putchar(size_t c) {
  putchar((int)c);
  return 0;
}
static inline size_t ebz_car(size_t p) { return ((ebz_cons_t *)p)->car; }
static inline size_t ebz_cdr(size_t p) { return ((ebz_cons_t *)p)->cdr; }
static inline size_t ebz_if(size_t c, size_t t, size_t e) {
  if (c != 0) {
    return ((size_t(*)(size_t)) * (size_t *)t)(t);
  } else {
    return ((size_t(*)(size_t)) * (size_t *)e)(e);
  }
}
static inline size_t eb_putchar(size_t a1, size_t a2) {
  return ebz_putchar(a2);
}
static inline size_t eb_cons(size_t a1, size_t a2, size_t a3) {
  return ebz_cons(a2, a3);
}
static inline size_t eb_car(size_t a1, size_t a2) { return ebz_car(a2); }
static inline size_t eb_cdr(size_t a1, size_t a2) { return ebz_cdr(a2); }
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
  return l > r ? 1 : 0;
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
    r = ebz_cons(p[i - 1], r);
  };
  *exist = r;
}
static inline size_t eb_read_file(size_t a1, size_t f) {
  char name[1024];
  char *s = name;
  while (f) {
    *s++ = ebz_car(f);
    f = ebz_cdr(f);
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

extern size_t eb_main(size_t closure, size_t args);

int main(int argc, char **argv) {
  printf("ENTER\n");
  size_t a = 0;
  while (argc > 1) {
    char *c = argv[--argc];
    size_t next = 0;
    ebz_stol(&next, c);
    a = ebz_cons(next, a);
  }
  int got = (int)((size_t(*)(size_t, size_t))eb_main)(0, a);
#if EB_DEBUG
  fprintf(stderr, "// %zu pairs\n", ebz_alloc_total);
#endif
  printf("EXIT\n");
  return got;
}
