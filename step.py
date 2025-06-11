
import subprocess

once = False

with open('ebrew.out.h', 'w') as f:
    subprocess.check_call(f'node driver/comp.mjs cpp eb/test3.eb', stdout = f)

try:
    res = subprocess.run(f'gcc -E -P ebrew.out.h', capture_output = True)
    first = res.stdout.decode('utf-8')

    if once:
        print(first.replace('\r', '').strip())
    else:
        last = 'eb_main(_, _)'
        steps = 0
        while True:
            res = subprocess.run(f'gcc -E -P ebrew.out.h -D"RUN()={last}"', capture_output = True)
            cur = res.stdout.decode('utf-8')
            if cur == last:
                break
            last = cur
            steps += 1
            print(last.strip())
        res = subprocess.run(f'gcc -E -P ebrew.out.h -D"RUN()=FINAL {last}"', capture_output = True)
        last = res.stdout.decode('utf-8')
        steps += 1
        while True:
            res = subprocess.run(f'gcc -E -P ebrew.out.h -D"RUN()={last}"', capture_output = True)
            cur = res.stdout.decode('utf-8')
            if cur == last:
                break
            last = cur
            steps += 1
        print(last.strip())
        print(f'// {steps} steps')

except KeyboardInterrupt:
    print()
