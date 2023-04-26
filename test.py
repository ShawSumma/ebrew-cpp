import logging
import os
import operator
import time
import sys

sys.setrecursionlimit(10 ** 5)

logging.basicConfig(filename="/dev/stdout", level=logging.DEBUG, format="%(message)s")

from ebb.run import Env, is_bad

env = Env()

def tostr(s):
    r = 0
    for i in s[::-1]:
        r = (ord(i), r)
    return r

def fromstr(s):
    r = []
    while isinstance(s, tuple):
        r.append(chr(s[0]))
        s = s[1]
    return ''.join(r)

def wrap(f):
    def inner(args):
        return f(*args[::-1])
    return inner

def rwrap(f):
    return lambda args: f(*args)

def ffi_if(c, t, f):
    if c:
        return t.invoke(())
    else:
        return f.invoke(())

def ffi_read(f):
    with open(fromstr(f)) as i:
        return tostr(i.read())
    
def ffi_print(s):
    if isinstance(s, tuple):
        print(fromstr(s))
    else:
        print(s)

def ffi_input(s):
    return input(fromstr(s))

def ffi_putchar(c):
    outc.write(chr(c))

def ffi_pair(a, b):
    return (a, b)

def ffi_first(p):
    return p[0]

def ffi_second(p):
    return p[1]

env.define("if", rwrap(ffi_if))
env.define("putchar", wrap(ffi_putchar))
env.define("equal", wrap(operator.eq))
env.define("above", wrap(operator.lt))
env.define("add", wrap(operator.add))
env.define("sub", wrap(operator.sub))
env.define("mul", wrap(operator.mul))
env.define("div", wrap(operator.floordiv))
env.define("mod", wrap(operator.mod))
env.define("read-file", wrap(ffi_read))
env.define("pair", rwrap(ffi_pair))
env.define("first", wrap(ffi_first))
env.define("second", wrap(ffi_second))

with open("ebb.ebb") as f:
    env.source(f.read())

a = (tostr(sys.argv[1]), 0)

outc = sys.stdout

res = env.call("main", (a,))
if is_bad(res):
    print(res.msg)

os._exit(0)
