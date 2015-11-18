import subprocess
from getopts_config import getopts

def main(opts):
    install_docker(opts)

def install_docker(opts):
    try:
        pipe=subprocess.Popen(['docker'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out,err=pipe.communicate()
        if len(err) > 0:
            print err
        return
    except IOError as e:
        pipe=subprocess.Popen(['curl', '-sSL', opts.docker_uri, '|', 'sudo', 'sh'],
                              stdout=subprocess.PIPE, stderr=subprocess.PIPE,
        

def get_opts():
    opts=getopts('config.ini')
    parser=opts.parser
    parser.add_argument('-some_arg', default='some arg')
    parser.add_argument('-v', action='store_true', help='verbose')
    parser.add_argument('-d', action='store_true', help='debugging flag')
    opts.parse()

    for d in dir(opts):
        if not d.startswith('_'):
            print 'main: opts.%s=%s' % (d, getattr(opts, d))
    return opts

if __name__=='__main__':
    sys.exit(main(get_opts()))

