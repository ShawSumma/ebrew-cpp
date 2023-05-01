import logging
import sys
import faulthandler
import glob
import os

dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))

faulthandler.enable(file=sys.stderr, all_threads=True)

logging.basicConfig(filename="/dev/stdout", level=logging.DEBUG, format="%(message)s")

for path in glob.glob(f'{dir}/temper.out/*/py'):
    sys.path.append(path)

from ebb.src.comp import Env

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
env.call("main-lang", (lang, src))
