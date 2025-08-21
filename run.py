
import subprocess
import tempfile
import sys
import glob
import os

HERE: str = os.path.dirname(os.path.realpath(__file__)) 

def run_file(path: str) -> str:
    cpp: str = subprocess.check_output(['node', 'driver/comp.mjs', 'cpp', path]).decode('utf-8')
    with open('ebrew.c', 'w') as f:
        f.write(cpp)
    with tempfile.TemporaryFile('w+') as f:
        f.write(cpp)
        f.seek(0)
        return subprocess.check_output(['cc', '-w', '-', '-E', '-P'], stdin = f, cwd = HERE).decode('utf-8')

def run_str(code: str) -> str:
    with tempfile.NamedTemporaryFile('w+') as f:
        f.write(code)
        f.seek(0)
        return run_file(f.name)

class Object:
    pass

class Nat(Object):
    value: int

    __match_args__ = ('value',)

    def __init__(self, value: int) -> None:
        self.value = value

    def __hash__(self) -> int:
        return hash(self.value)
    
    def __eq__(self, other: object) -> bool:
        return other == self.value or (isinstance(other, Nat) and other.value == self.value)
    
    def __str__(self) -> str:
        return str(self.value)
    
class Cons(Object):
    a: Object
    b: Object
    
    __match_args__ = ('a', 'b')
    
    def __init__(self, a: Object, b: Object):
        self.a = a
        self.b = b

    def __hash__(self) -> int:
        return hash((self.a, self.b))

    def __eq__(self, other: object) -> bool:
        return isinstance(other, Object) and other.a == self.a and other.b == self.b

    def __str__(self) -> str:
        return f'cons {self.a} {self.b}'

class ParseError(Exception):
    pass

def parse_result(src: str) -> Object:
    stack: list[Object] = []
    for c in reversed(src):
        match c:
            case '0':
                stack.append(Nat(0))
            case '1':
                match stack.pop():
                    case Nat(n):
                        stack.append(Nat(n+1))
                    case Cons(a, b):
                        raise ParseError('invalid: (1, (2, a, b))')
            case '2':
                b, a = stack.pop(), stack.pop()
                stack.append(Cons(a, b))
            case _:
                if c not in '() ,':
                    raise ParseError(f'invalid char: {c}')
    return stack.pop()

def main():
    for arg in sys.argv[1:]:
        for file in glob.glob(arg, recursive = True):
            res: str = run_file(file).strip('\r\n')
            try:
                py: Object = parse_result(res)
            except Exception as e:
                print(res)
                continue
            print(py)
    # print(py)

if __name__ == '__main__':
    main()
