
import subprocess
import sys
import glob
import os
import re
import time
from driver.comp import to_cpp

HERE: str = os.path.dirname(os.path.realpath(__file__)) 
CLEAR = '\x1B[1J\x1B[H'
FRAME_TIME = 50
# FRAME_TIME = 1000/20
EXPS = (8, 8, 8, 8)
# CLEAR = '\x1B[2J\x1B[H'

assert os.path.exists(HERE) and HERE != ''

class CPP:
    code: str
    cpp: str

    def __init__(self, code: str) -> None:
        self.code = code
        self.cpp = 'eb_main(_, _)'

    def step(self, steps: int = 1) -> bool:
        with open('ebrew.h', 'wb') as f:
            f.write(self.code.encode('utf-8'))
        steps -= 1
        pre = ''
        post = ''
        for n, sub_calls in enumerate(EXPS):
            pre += f'EXP{n}(' * (steps % sub_calls)
            post += ')' * (steps % sub_calls)
            steps //= sub_calls
        pre += f'EXP{len(EXPS)}(' * steps
        post += f')' * steps
        if pre != '':
            pre += '\n'
        if post != '':
            post += '\n'
        prog = f'#define RUN\n#include "ebrew.h"\n{pre}{self.cpp}\n{post}'
        with open('cur.c', 'wb') as f:
            f.write(prog.encode('utf-8'))
        res = subprocess.run(['gcc', '-E', '-P', 'cur.c'], capture_output = True).stdout.decode('utf-8').strip()
        if res == self.cpp:
            return False
        else:
            self.cpp = res
            return True

    def __str__(self) -> str:
        return f'{self.code}\n{self.cpp}\n'

class EB:
    code: str

    def __init__(self, code: str) -> None:
        self.code = code

    def compile(self) -> CPP:
        return CPP(to_cpp(self.code))

    def __str__(self) -> str:
        return self.code

def format_values(src: str, zeros: bool = True, ones: int = -1, twos: int = -1, lists: bool = True) -> str:
    src = src.replace(',', '@')

    if zeros:
        src = re.sub('\\(0\\)', '0', src)
    
    while True:
        ones -= 1
        next = re.sub('\\(1@ (\\d+)\\)', lambda m: str(int(m.group(1)) + 1), src)
        if next == src or ones == 0:
            break
        src = next

    while True:
        twos -= 1
        next = re.sub('\\(2@ ([^()@]+)@ ([^()@]+)\\)', lambda m: f'[{m.group(1)}, {m.group(2)}]', src)
        if next == src or twos == 0:
            break
        src = next

    src = src.replace('@', ',')

    return src

def format_program(text: str) -> str:
    a, b, c = text.partition('(')
    ls = re.split('(?<=\\) )(?=\\()', b + c)
    text = '\n'.join(reversed(ls))
    a = a.strip()
    if a != '':
        text = f'{a}\n\n' + text
    text = '#define RUN\n#include "ebrew.h"\n\n' + text
    return text

def main():
    max_steps = 1
    for arg in sys.argv[1:]:
        for file in glob.glob(arg, recursive = True):
            with open(file) as f:
                eb: EB = EB(f.read())
            cpp: CPP = eb.compile()
            with open('ebrew.h', 'wb') as f:
                f.write(cpp.code.encode('utf-8'))
            continue
            total_steps = 0
            steps = 1.0
            time_str = ''
            while True:
                display = format_program(format_values(cpp.cpp))
                # print(CLEAR + time_str + display)
                start = time.time()
                total_steps += int(steps)
                if total_steps > max_steps:
                    break
                if not cpp.step(steps = int(steps)):
                    break
                ms_per_steps = (time.time() - start) * 1000
                if ms_per_steps == 0:
                    ms_per_steps = 1
                
                time_str = f'{int(steps / ms_per_steps * 1000): 5} exps/s\n'
                if ms_per_steps < FRAME_TIME * 0.8:
                    steps *= 1.05
                if ms_per_steps > FRAME_TIME:
                    steps /= 1.5
                elif ms_per_steps > FRAME_TIME * 0.9:
                    steps /= 1.05
                # steps = 1.0

                time_str = f'// steps: {total_steps}\n'

                # steps = (steps + 1) * FRAME_TIME / ms_per_iter - 1
                
                # time_str = ''
                # if ms_per_iter + 1 < FRAME_TIME:
                #     time.sleep((FRAME_TIME - (ms_per_iter + 1)) / 1000)
                time_str = ''
                # steps = 1.0

            # time_str = f'// steps: {total_steps}\n'
            # print(CLEAR + time_str + display)

            print(cpp.cpp)

if __name__ == '__main__':
    main()
