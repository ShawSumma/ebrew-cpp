
import subprocess

with open('ebrew.out.h', 'w') as f:
    subprocess.check_call(f'node driver/comp.mjs cpp eb/test.eb', stdout = f)

try:
    res = subprocess.run(f'gcc -E -P ebrew.out.h', capture_output = True)
    first = res.stdout.decode('utf-8')

    run = 'SPLAT x'
    while True:
        run = f'EXP({run})'
        res = subprocess.run(f'gcc -E -P ebrew.out.h -D"RUN(x)={run}"', capture_output = True)
        text = res.stdout.decode('utf-8')
        print(text.replace('\r', '').strip())
        if text == first:
            break

except KeyboardInterrupt:
    print()
