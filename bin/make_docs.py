#!/usr/bin/env python

'''
Builds the documentation for a package.
Runs sphinx-apidoc and then 'python setup.py build_sphinx' in a Luminus git repo.
'''

try:
    import sys
    import subprocess
    import os
    import re
    import pbr.version
    import subprocess
    import shutil
except Exception:
    sys.exit(0)                 # proceed with push


def main(opts):
        
    try:
        branch=get_branch().strip()
        if branch != 'master':
            print 'not on branch master ("{}")'.format(branch)
            # return 1      

        pkg_name=opts.package_name
        pkg_title=cc2title(pkg_name)
        pkg_version=str(pbr.version.VersionInfo(pkg_name))
        pkg_author=opts.package_author

        if not os.path.isdir('.git'):
            raise RuntimeError('not in a git top-level directory')

        clean()

        # call sphinx-apidoc
        cmd=[opts.sphinx_apidoc, '-o', 'docs', '-f', '-F', '-e', '-H', pkg_title, '-A', pkg_author, '-V', pkg_version, pkg_name]
        print 'running {}'.format(' '.join(cmd))
        subprocess.check_call(cmd)
        if not os.path.isdir('docs'):
            raise RuntimeError('sphinx-apidoc appears to have failed')

        # call setup.py build_sphinx
        subprocess.check_call([opts.python, 'setup.py', 'build_sphinx'])

        # put documentation in docs/:
        target_dir=opts.target
        if os.path.exists(target_dir):
            if os.path.isdir(target_dir):
                shutil.rmtree(target_dir)
            else:
                os.unlink(target_dir)
        shutil.copytree('build/sphinx/html', target_dir)

        # git add and commit docs:
        clean()
        subprocess.check_call(['git', 'add', target_dir])
        subprocess.check_call(['git', 'commit', '-a', '-m', "adding docs"])
        subprocess.check_call(['git', 'push', 'origin', opts.branch])
        
        return 0
    except Exception as e:
        bail(opts)

def clean():
    for target in 'index.rst Makefile _build conf.py conf.pyc _static _templates make.bat doc'.split(' '):
        if os.path.exists(target):
            if os.path.isdir(target):
                shutil.rmtree(target)
            else:
                os.unlink(target)


def get_branch():
    cmd1=['git', 'branch']
    cmd2=['grep', '^/*']
    cmd3=['cut', '-c3-']
    p1=subprocess.Popen(cmd1, stdout=subprocess.PIPE)
    p2=subprocess.Popen(cmd2, stdin=p1.stdout, stdout=subprocess.PIPE)
    p3=subprocess.Popen(cmd3, stdin=p2.stdout, stdout=subprocess.PIPE)
    p1.stdout.close()
    p2.stdout.close()
    output=p3.communicate()[0]
    return output
    
def cc2title(cc):
    return "'{}'".format(' '.join([w.capitalize() for w in cc.split('_')]))

def getopts():
    import argparse

    def __get_package_name():
        return os.getcwd().split('/')[-1]

    parser = argparse.ArgumentParser(description='')
    #parser.add_argument('remote') # these two are for git pre-push hook
    #parser.add_argument('git_url')
    parser.add_argument('-package-name', default=__get_package_name())
    parser.add_argument('-package-author', default='Luminus Networks')
    parser.add_argument('-target', default='docs', help='target directory for docs')
    parser.add_argument('-python', default='/local/venvs/vpython/bin/python', help='python executable')
    parser.add_argument('-lib', action='append')
    parser.add_argument('-sphinx-apidoc', default='/local/venvs/vpython/bin/sphinx-apidoc', help='sphinx-apidoc executable')
    parser.add_argument('-branch', default='master', help='git branch')
    parser.add_argument('-d', action='store_true', help='debugging flag')

    opts=parser.parse_args()
    if opts.d:
        print opts
    return opts


def bail(opts):
    if opts.d:
        import traceback
        traceback.print_exc()
    else:
        print '{}: {}'.format(e.__class__.__name__, e)
    sys.exit(1)

if __name__=='__main__':
    opts=getopts()
    try:
        sys.exit(main(opts))
    except Exception as e:
        bail(opts)
