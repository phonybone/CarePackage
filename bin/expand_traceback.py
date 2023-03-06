#!/usr/bin/env python
# -*- coding utf-8 -*-
"""
Read a python traceback from stdin, but one where everything has been squashed
into a single line with '\n's.  Un-squash and print to stdout.

Any line that is not a python traceback is just echo'd to stdout.
"""
import sys


def main():
    for line in sys.stdin:
        if 'Traceback (most recent call last)' not in line:
            print(line)
            continue
        for bit in line.split(r'\n'):
            bitly = bit.replace('\n', '')
            if bitly:
                print(bitly)


if __name__ == '__main__':
    main()
