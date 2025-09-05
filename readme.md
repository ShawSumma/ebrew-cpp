
# ebrew to cpp

A compiler from the ebrew language to the C Preprocessor.

The bootstrap compier is written in [temper](https://temperlang.github.io/tld/)


```sh
temper build -b py
python3 build.py -t cpp example/gen-range.eb -o gen-range.inc
gcc -x c -E -P gen-range.inc
```
