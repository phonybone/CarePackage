#!/usr/bin/env python
# -*- coding utf-8 -*-
"""
Given a .yml file, export all values to the environment.
"""

import sys
import yaml


def main(yml_fn, entry):
    with open(yml_fn) as stuff:
        data = yaml.safe_load(stuff)
        if entry is not None:
            data = data[entry]
        data = data.get('stringData', data)

    for key, value in data.items():
        print(F"export {key}='{value}'")


if __name__ == '__main__':
    usage = 'export_yml <fn.yml> [entry]'

    def die(msg, exit_code=1):
        print(msg, file=sys.stderr)
        sys.exit(exit_code)

    try:
        yml_fn = sys.argv[1]
    except IndexError:
        die(usage)

    try:
        entry = sys.argv[2]
    except IndexError:
        entry = None

    main(yml_fn, entry)
