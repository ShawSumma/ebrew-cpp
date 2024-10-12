
typedef __typeof__(sizeof(0)) size_t;
typedef struct {
} FILE;

FILE *fopen(const char *name, const char *mode);
void fclose(FILE *file);

int feof(FILE *file);
int fgetc(FILE *file);

int putchar(int c);

struct ebz_cons_t;
typedef struct ebz_cons_t ebz_cons_t;
struct ebz_cons_t {
  size_t car : 32;
  size_t cdr : 31;
  size_t set : 1;
};

static ebz_cons_t ebz_base[1000000] = {0};
static size_t ebz_used = 0;

static inline size_t ebz_cons(size_t car, size_t cdr) {
  int len = sizeof(ebz_base) / sizeof(ebz_cons_t);
  int hash = (int)(car * len * 1.618) ^ cdr;
  int look = hash % len;
  while (1) {
    ebz_cons_t *pair = &ebz_base[look];
    if (!pair->set) {
      pair->car = car;
      pair->cdr = cdr;
      pair->set = 1;
      ebz_used += 1;
      break;
    } else if (pair->car == car && pair->cdr == cdr) {
      break;
    }
    look += 1;
    if (look == len) {
      look = 0;
    }
  }
  return look;
}

static inline size_t eb_putchar(size_t ctx, size_t chr) {
  putchar((int)chr);
  return 0;
}
static inline size_t eb_cons(size_t ctx, size_t a2, size_t a3) {
  return ebz_cons(a2, a3);
}
static inline size_t eb_car(size_t ctx, size_t pair) {
  return ebz_base[pair].car;
}
static inline size_t eb_cdr(size_t ctx, size_t pair) {
  return ebz_base[pair].cdr;
}
static inline size_t eb_if(size_t ctx, size_t cond, size_t then, size_t els) {
  if (cond != 0) {
    return ((size_t(*)(size_t)) * (size_t *)then)(then);
  } else {
    return ((size_t(*)(size_t)) * (size_t *)els)(els);
  }
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
  while (len > 0) {
    r = ebz_cons(p[--len], r);
  };
  *exist = r;
}

static inline size_t eb_read_file(size_t ctx, size_t f) {
  char name[1024];
  char *s = name;
  while (f) {
    *s++ = eb_car(0, f);
    f = eb_cdr(0, f);
  }
  *s++ = 0;
  FILE *k = fopen(name, "r");
  if (k == (void *)0) {
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
  size_t a = 0;
  while (argc > 1) {
    char *c = argv[--argc];
    size_t next = 0;
    ebz_stol(&next, c);
    a = ebz_cons(next, a);
  }
  return (int)((size_t(*)(size_t, size_t))eb_main)(0, a);
}
