#!/usr/bin/env python

'''
Builds the documentation for a package.
Runs sphinx-quickstart and then 'python setup.py build_sphinx' in a Luminus git repo.
'''

import sys
import subprocess
import os
import re
import pbr.version
import subprocess
import shutil

def main(opts):
    pkg_name=opts.package_name
    pkg_title=cc2title(pkg_name)
    pkg_version=str(pbr.version.VersionInfo(pkg_name))
    pkg_author=opts.package_author
    
    if not os.path.isdir('.git'):
        raise RuntimeError('not in a git top-level directory')

    clean()
    
    subprocess.call(['sphinx-quickstart', '-q', '-p', pkg_title, '-a', pkg_author, '-v', pkg_version, '--ext-autodoc', '--ext-viewcode', '--makefile'])
    
    subprocess.call(['python', 'setup.py', 'build_sphinx'])

    return 0

def clean():
    for target in 'index.rst Makefile _build conf.py conf.pyc _static _templates make.bat'.split(' '):
        if os.path.exists(target):
            if os.path.isdir(target):
                shutil.rmtree(target)
            else:
                os.unlink(target)


    
def cc2title(cc):
    return ' '.join([w.capitalize() for w in cc.split('_')])

def getopts():
    import argparse

    def __get_package_name():
        return os.getcwd().split('/')[-1]

    parser = argparse.ArgumentParser(description='')
    parser.add_argument('remote')
    parser.add_arguemnt('git_url')
    parser.add_argument('-package-name', default=__get_package_name())
    parser.add_argument('-package-author', default='Luminus Networks')
    parser.add_argument('-d', action='store_true', help='debugging flag')

    opts=parser.parse_args()
    if opts.d:
        print opts
    return opts


if __name__=='__main__':
    opts=getopts()
    try:
        sys.exit(main(opts))
    except Exception as e:
        if opts.d:
            import traceback
            traceback.print_exc()
        else:
            print '{}: {}'.format(e.__class__.__name__, e)
        sys.exit(1)

