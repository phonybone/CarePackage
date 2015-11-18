import sys
from configobj import ConfigObj
import argparse

class getopts(object):
    def __init__(self, config_fn=None):
        parser = argparse.ArgumentParser(description='')
        self.__parser=parser
    #    parser.add_argument('required_arg')
        if config_fn:
            self.__load_config(config_fn, parser)

    @property
    def parser(self):
        return self.__parser

    def parse(self):
        opts=self.__parser.parse_args()
        if opts.d:
            print opts
        self.__copy_opts(opts)
        return self

    def __load_config(self, config_fn, parser):
        try:
            with open(config_fn) as f:
                pass                # config_fn exists; configobj doesn't check for this
        except IOError as e:
            print e
            sys.exit(1)

        conf=ConfigObj(config_fn)
        if 'getopts' not in conf:
            print >>sys.stderr, 'No section "getopts" in config "%s"' % config_fn
            sys.exit(1)

        for k,v in conf['getopts'].iteritems():
            cls,val=self.__infer_cls(k,v)
            if cls==bool:
                if val:
                    parser.add_argument('-'+k, action='store_false')
                else:
                    parser.add_argument('-'+k, action='store_true')
            else:
                parser.add_argument('-'+k, default=v, type=cls)



    def __infer_cls(self, k, v):
        # infer type of value:
        if v.lower() == 'true':
            return bool, True
        elif v.lower() == 'false':
            return bool, False
        else:
            try:
                val=int(v)
                cls=int
            except ValueError:
                try:
                    val=float(v)
                    cls=float
                except ValueError:
                    cls=str
                    val=v
        return cls, val
        
    def __copy_opts(self, opts):
        for d in dir(opts):
            if not d.startswith('_'):
                setattr(self, d, getattr(opts, d))
