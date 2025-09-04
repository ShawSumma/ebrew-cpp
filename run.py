
from sys import argv
from driver.comp import to_cpp

def main():
    with open(argv[-1], 'r') as f:
        src = f.read()
    out = to_cpp(src)
    with open('ebrew.h', 'w') as f:
        f.write(out)

if __name__ == '__main__':
    main()
