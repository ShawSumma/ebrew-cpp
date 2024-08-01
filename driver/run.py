import sys
import os
import logging

logging.basicConfig(filename="/dev/stdout", level=logging.DEBUG, format="%(message)s")

dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

sys.path.append('temper.out/py/temper-core')
sys.path.append('temper.out/py/eb')

from eb.interp import Env
from eb.value import Value

def read(name):
    with open(name) as f:
        return f.read()

env = Env()

ebfile = read(sys.argv[1])
env.source(ebfile)
args = Value.int(0)
for i in reversed(sys.argv[2:]):
    args = Value.cons(i, Value.string(args))
r = env.call("main", (args,))
env.flush()
# print(r.to_string())