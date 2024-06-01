#!/usr/bin/env python
# -*- coding utf-8 -*-
"""
Read a python traceback from stdin, but one where everything has been squashed
into a single line with '\n's.  Un-squash and print to stdout.

Any line that is not a python traceback is just echo'd to stdout.
"""
import sys

# splitter = r'\n'
# replacement = ''
# splitter = ' File'
# replacement = "\nFile"


def main(splitter, replacement):
    for line in sys.stdin:
        if 'Traceback (most recent call last)' not in line:
            print(line)
            continue

        for bit in line.split(splitter):
            # bitly = bit.replace(splitter, replacement)
            if bit:
                print(F"{replacement}{bit}")


if __name__ == '__main__':
    if len(sys.argv) == 3:
        splitter = sys.argv[1]
        replacement = sys.argv[2]
    else:
        splitter = r'\n'
        replacement = ''
    main(splitter, replacement)
