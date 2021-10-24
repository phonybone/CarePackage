#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Given the filename of a python file that defines a __version__ variable, parse
the relevant line and bump either the patch, minor, or major version as indicated.
Rewrite the file.

Author: Victor Cassen
'''

import sys
import os
import re
import shutil


def main(opts):
    version_line_regex = re.compile(r"^__version__ ?= ?['\"](\d+)\.(\d+)\.(\d+)['\"]$")
    found = False

    with open(opts.fn) as f_in, open(f"{opts.fn}.tmp", "w") as f_out:
        for line in [line.strip() for line in f_in]:
            mg = version_line_regex.match(line)
            if mg:
                major, minor, patch = mg.groups()
                if opts.portion == 'major':
                    major = int(major) + 1
                elif opts.portion == 'minor':
                    minor = int(minor) + 1
                else:
                    patch = int(patch) + 1
                line = f'__version__ = "{major}.{minor}.{patch}"'
                found = True
            print(line, file=f_out)

    if not found:
        print(f"no version line found in {opts.fn}", file=sys.stderr)
        try:
            os.unlink(f"{opts.fn}.tmp")
        except OSError:
            pass
        return 1

    if opts.backup:
        shutil.copyfile(opts.fn, f"{opts.fn}.{opts.backup_suffix}")
        print(f"{opts.fn}.{opts.backup_suffix} written")

    shutil.copyfile(f"{opts.fn}.tmp", opts.fn)
    print(f"{opts.fn} re-written: version = '{major}.{minor}.{patch}'")

    return 0


def getopts():
    import argparse
    from argparse import RawTextHelpFormatter  # Note: this applies to all options, might not always be what we want...
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=RawTextHelpFormatter)
    parser.add_argument('fn', help="file to edit")
    parser.add_argument('--portion', default='minor', help='one of "major", "minor", or "patch"', choices=['major', 'minor', 'patch'])
    parser.add_argument('--backup', default=False, action='store_true')
    parser.add_argument('--backup-suffix', default='orig')
    parser.add_argument('-v', action='store_true', help='verbose')
    parser.add_argument('-d', action='store_true', help='debugging flag')
    # parser.add_argument('args', nargs=argparse.REMAINDER)

    opts = parser.parse_args()
    if opts.d:
        os.environ['DEBUG'] = 'True'
        print(opts)
    return opts


if __name__ == '__main__':
    opts = getopts()
    try:
        rc = main(opts)
        if rc is None:
            rc = 0
        sys.exit(rc)
    except Exception as e:
        if opts.d:
            import traceback
            traceback.print_exc()
        else:
            print('error: {} {}'.format(type(e), e))
        sys.exit(1)
