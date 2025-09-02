import sys
import os
import logging

logging.basicConfig(stream = sys.stdout, level=logging.DEBUG, format="%(message)s")

sys.path.append('temper.out/py/std')
sys.path.append('temper.out/py/temper-core')
sys.path.append('temper.out/py/eb')

from eb import Env, run_todo, string, unstring

HERE = os.path.dirname(os.path.realpath(__file__))
assert os.path.exists(HERE) and HERE != ''

def read_file(args, k):
    name = args[0]
    with open(name, 'rb') as f:
        text = f.read().decode('utf-8')
    k(unstring(text))
    run_todo()

def compile(lang: str, text: str) -> str:
    env = Env()

    chars = []

    def putchar(args, k):
        chars.append(chr(int(args[0].to_string())))
        k(args[0])
    
    env.add('read-file', read_file)
    env.add('putchar', putchar)

    with open(f'{HERE}/../eb/eb.eb') as f:
        env.source(f.read())

    env.call('main-lang', [string(lang), string(text)])

    return ''.join(chars)

def to_cpp(text: str) -> str:
    return compile('cpp', text)

def main():
    with open(sys.argv[2]) as f:
        text = f.read()
    print(compile(sys.argv[1], text))

if __name__ == '__main__':
    main()
