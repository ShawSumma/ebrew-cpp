#!/usr/bin/env sh

set -ex

set MEM=MALLOC

test -d temper.out || temper build -b js

node driver/comp.mjs c eb/eb.eb > ebrew.c

gcc ebrew.c -Oz -o ebrew.exe -I . -DEB_MEM=EB_MEM_$MEM
strip ebrew.exe
wc -c ebrew.exe

./ebrew.exe --target c eb/eb.eb > ebrew.self.c
cmp ebrew.c ebrew.self.c
