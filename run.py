
import subprocess
import sys
import glob
import os
import re
import time

HERE: str = os.path.dirname(os.path.realpath(__file__)) 
CLEAR = '\x1B[1J\x1B[H'
# CLEAR = '\x1B[2J\x1B[H'

assert os.path.exists(HERE) and HERE != ''

class CPP:
    code: str
    cpp: str

    def __init__(self, code: str) -> None:
        self.code = code
        self.cpp = 'eb_main(_, _)'

    def step(self) -> bool:
        with open('ebrew.c', 'wb') as f:
            f.write(self.code.encode('utf-8'))
        prog = f'#define RUN\n#include "ebrew.c"\n{self.cpp}'
        with open('cur.c', 'wb') as f:
            f.write(prog.encode('utf-8'))
        res = subprocess.run(['gcc', '-E', '-P', 'cur.c'], capture_output = True)
        if res == self.cpp:
            return False
        else:
            self.cpp = res.stdout.decode('utf-8').strip()
            return True


    def __str__(self) -> str:
        return f'{self.code}\n{self.cpp}\n'

class EB:
    code: str

    def __init__(self, code: str) -> None:
        self.code = code

    def compile(self) -> CPP:
        with open('out.eb', 'wb') as f:
            f.write(self.code.encode('utf-8'))
        res = subprocess.run(['node', f'{HERE}/driver/comp.mjs', 'cpp', 'out.eb'], capture_output = True)
        return CPP(res.stdout.decode('utf-8'))

    def __str__(self) -> str:
        return self.code

def format_values(src, zeros: bool = True, ones: int = -1, twos: int = -1) -> str:
    if zeros:
        src = re.sub('\\(0\\)', '0', src)
    
    while True:
        ones -= 1
        next = re.sub('\\(1, (\\d+)\\)', lambda m: str(int(m.group(1)) + 1), src)
        if next == src or ones == 0:
            break
        src = next

    while True:
        twos -= 1
        next = re.sub('\\(2, ([^(),]+), ([^(),]+)\\)', lambda m: f'[{m.group(1)}, {m.group(2)}]', src)
        if next == src or ones == 0:
            break
        src = next

    return src

def format_program(text: str, run: bool = True) -> str:
    a, b, c = text.partition('(')
    ls = re.split('(?<=\\) )(?=\\()', b + c)
    text = '\n'.join(reversed(ls))
    a = a.strip()
    if a != '':
        text = f'{a}\n\n' + text
    if run:
        text = '#define RUN\n#include "ebrew.c"\n\n' + text
    return text

def main():
    for arg in sys.argv[1:]:
        for file in glob.glob(arg, recursive = True):
            with open(file) as f:
                eb: EB = EB(f.read())
            cpp: CPP = eb.compile()
            while True:
                print(CLEAR + format_program(format_values(cpp.cpp)))
                # print(CLEAR + format_values(cpp.cpp))
                if not cpp.step():
                    break
                # time.sleep(1)

if __name__ == '__main__':
    main()
