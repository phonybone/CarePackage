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
            data = json.loads(line.strip())
        except Exception:
            continue

        if not isinstance(data, dict) or 'message' not in data:
            continue

        print(data['severity'], "\n".join(data['message'].split(r'\n')))

        fuse -= 1
        if fuse == 0:
            print('bye')
            break


if __name__ == '__main__':
    main()
