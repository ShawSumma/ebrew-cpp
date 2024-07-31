import sys
import os
import logging

logging.basicConfig(filename="/dev/stdout", level=logging.DEBUG, format="%(message)s")

dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

sys.path.append('temper.out/py/temper-core')
sys.path.append('temper.out/py/ebb')

from ebb.interp import Env
from ebb.value import Value

def read(name):
    with open(name) as f:
        return f.read()

env = Env()

ebbfile = read(f"{dir}/ebb/ebb.ebb")
env.source(ebbfile)
if len(sys.argv) <= 1:
    lang = 'c'
else:
    lang = sys.argv[1]
if len(sys.argv) <= 2:
    src = ebbfile
else:
    src = read(sys.argv[2])
env.call("main-lang", (Value.string(lang), Value.string(src)))
env.flush()
