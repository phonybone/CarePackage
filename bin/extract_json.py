#!/usr/bin/env python
# -*- coding utf-8 -*-
"""
sys.stdin filter that derserializes any json found on the stream.
"""
import sys
import json


def main():
    fuse = -1
    for line in sys.stdin:
        try:
            data = json.loads(line)
        except Exception:
            print(line.rstrip())
            continue

        print(json.dumps(data, indent=2))

        fuse -= 1
        if fuse == 0:
            print('bye')
            break


if __name__ == '__main__':
    main()
