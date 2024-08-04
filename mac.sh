#!/usr/bin/env sh

set -ex

test -d temper.out || temper build -b py

export PYTHONPATH=temper.out/py/*
node driver/comp.mjs c eb/eb.eb > ebrew.c

clang ebrew.c -Oz -flto -o ebrew.out -Wl,-stack_size -Wl,10000000 -I.
strip ebrew.out
wc -c ebrew.out

./ebrew.out --target c eb/eb.eb > ebrew.self.c
cmp ebrew.c ebrew.self.c
