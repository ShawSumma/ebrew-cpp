#!/usr/bin/env sh

temper build -b py && \
export PYTHONPATH=temper.out/py/* && \
pypy3 driver/comp.py c eb/eb.eb > ebrew.c && \
clang ebrew.c -O3 -flto -o ebrew.out -Wl,-stack_size -Wl,10000000
