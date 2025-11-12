import sys
import os
import logging
import glob
import argparse

logging.basicConfig(stream=sys.stdout, level=logging.DEBUG, format="%(message)s")

HERE = os.path.dirname(os.path.realpath(__file__))
assert os.path.exists(HERE) and HERE != ""

for file in glob.glob(os.path.join(HERE, "temper.out/py/*")):
    sys.path.append(file)

import ebrew


def read_file(args, k):
    name = args[0]
    with open(name, "rb") as f:
        text = f.read().decode("utf-8")
    k(ebrew.unstring(text))
    # ebrew.run_todo()


def compile(lang: str, text: str) -> str:
    env = ebrew.Env()

    chars = []

    def putchar(args, k):
        chars.append(chr(int(args[0].to_string())))
        k(args[0])

    env.add("read-file", read_file)
    env.add("putchar", putchar)

    with open(os.path.join(HERE, "src/ebrew.eb")) as f:
        env.source(f.read())

    env.call("main-lang", [ebrew.string(lang), ebrew.string(text)])

    return "".join(chars)


def to_cpp(text: str) -> str:
    return compile("inc", text)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input", type=argparse.FileType("r"))
    parser.add_argument("-o", "--output", type=argparse.FileType("w"), required=True)
    parser.add_argument(
        "-t", "--target", choices=["c", "inc", "ir", "min"], default="cpp"
    )
    args = parser.parse_args()

    args.output.write(compile(args.target, args.input.read()))
    args.output.close()


if __name__ == "__main__":
    main()
