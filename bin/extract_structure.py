#!/usr/bin/env python
'''
A script to extract nested structures (eg JSON objects) from a long string or file.
Works by scanning string and keeping track of nested (), {}, []'s 
'''
import sys

def main(opts):
    return 0

def getopts():
    import argparse
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('required_arg')
    parser.add_argument('-some_arg', default='some arg')
    parser.add_argument('-v', action='store_true', help='verbose')
    parser.add_argument('-d', action='store_true', help='debugging flag')

    opts=parser.parse_args()
    if opts.d:
        print opts
    return opts


if __name__=='__main__':
    sys.exit(main(getopts()))
