import sys
import os
import logging

logging.basicConfig(filename="/dev/stdout", level=logging.DEBUG, format="%(message)s")

dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

sys.path.append('temper.out/py/temper-core')
sys.path.append('temper.out/py/eb')

from eb.interp import Env
from eb.value import string

def read(name):
    with open(name) as f:
        return f.read()

env = Env()

ebfile = read(f"{dir}/eb/eb.eb")
env.source(ebfile)
if len(sys.argv) <= 1:
    lang = 'c'
else:
    lang = sys.argv[1]
if len(sys.argv) <= 2:
    src = ebfile
else:
    src = read(sys.argv[2])
env.call("main-lang", (string(lang), string(src)))
