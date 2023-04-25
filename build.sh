#!/usr/bin/env sh

set -e

for dir in $(find . -name py -depth 3)
do
    pushd $(PWD)
    cd "$dir" && python3 -m mypyc ./ --ignore-missing-imports
    popd
done
