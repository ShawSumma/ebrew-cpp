
import os
import string

os.chdir(os.path.dirname(__file__))

with open('char-table.h', 'w', encoding = 'utf-8') as f:
    for i in string.ascii_letters + string.digits + "=()[]{}<>+-*/%^&_=:./;!~`#,":
        ones = '1' * ord(i)
        f.write(f'#define len_to_char_{ones}0 {i}\n')

with open('int-table.h', 'w', encoding = 'utf-8') as f:
    f.write(f'#define int_0 (0)\n')
    for i in range(1, 256):
        f.write(f'#define int_{i} (1, int_{i-1})\n')
