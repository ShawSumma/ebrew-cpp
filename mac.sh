#!/usr/bin/env sh

set -ex

set MEM=MALLOC

test -d temper.out || temper build -b js

npm i temper.out/js/temper-core
node driver/comp.mjs c eb/eb.eb > ebrew.c

clang ebrew.c -Oz -flto -o ebrew.out -Wl,-stack_size,10000000 -I include -DEB_MEM=EB_MEM_$MEM
strip ebrew.out
wc -c ebrew.out

./ebrew.out --target c eb/eb.eb > ebrew.self.c
cmp ebrew.c ebrew.self.c
