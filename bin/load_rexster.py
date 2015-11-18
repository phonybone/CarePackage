'''
A script that takes a json file as downloaded from /data_service/children?snd_type=agent and
re-creates the graph in rexster.
'''

import sys
import json
import collections
import time

from bulbs.rexster import Config, Graph
from functools import wraps

stats=collections.defaultdict(int)

def time_this(stats):
    def wrap(f):
        @wraps(f)
        def wrapper(*args):
            start_time = int(round(time.time() * (1000 * 1000)))
            ret=f(*args)
            stop_time = int(round(time.time() * (1000 * 1000)))
            stats[f.__name__]=stop_time-start_time
            return ret
        return wrapper
    return wrap



def main(opts):
    g=get_graph(opts.rexster_uri, opts.graph_name)
    print 'got graph'
    data=get_data(opts.input)
    print 'got data'
    clear_graph(g)
    print 'cleared graph'
    for root in data:
        build_graph(g, root)
        stats['n_agents']+=1
    print 'stats: %s' % json.dumps(stats, indent=2)
    return 0

def get_graph(uri, graph_name):
    url='%s/graphs/%s' % (uri, graph_name)
    print 'url: %s' % url
    conf=Config(url)
    graph=Graph(conf)
    return graph

def get_data(fn):
    try:
        with open(fn) as f:
            return json.loads(f.read())
    except IOError as e:
        print e
        sys.exit(1)

@time_this(stats)
def clear_graph(g):
    edges=g.E
    if edges is not None:
        print 'deleting %d edges' % len(edges)
        for edge in g.edges.get_all():
            g.edges.delete(edge.eid)

    vertices=g.V
    if vertices is not None:
        print 'deleting %d vertices' % len(vertices)
        for vertex in g.vertices.get_all():
            g.vertices.delete(vertex.eid)

@time_this(stats)
def build_graph(g, node):
    global stats

    # stash children:
    if 'children' in node:
        _children=node['children']
        del node['children']

    # create this node:
    vertex=None
    try:
        vertex=g.vertices.create(**node)
        stats['n_vertices']+=1
    except SystemError as e:
#        print 'retrying "%s"' % node
        for k,v in node.items():
            print 'sizof(node[%s]): %s' % (k, sys.getsizeof(node[k]))
            if sys.getsizeof(k) > 10240:
                'deleting large key: %s' % k
                del node[k]
            elif sys.getsizeof(v) > 10240:
                node[k]='<too large, replaced>'
                print 'replacing key "%s" because too large' % k
        try:        
            vertex=g.vertices.create(**node)
            stats['n_vertices']+=1
        except SystemError as e:
            print 'failed twice to insert node, skipping'

    # restore children:
    try:
        node['children']=_children
    except NameError:
        pass

    # create sub-trees:
    if 'children' in node:
        for child in node['children']:
            child_vert=build_graph(g, child)
            if child_vert is not None:
                g.edges.create(vertex, 'belongs to', child_vert)
                stats['n_edges']+=1

    return vertex

    

def getopts():
    import argparse
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('-i', '--input')
    parser.add_argument('--rexster_uri', default='http://localhost:8182')
    parser.add_argument('--graph_name', default='local_data_service')
    parser.add_argument('-v', action='store_true', help='verbose')
    parser.add_argument('-d', action='store_true', help='debugging flag')

    opts=parser.parse_args()
    if opts.d:
        print opts
    return opts


if __name__=='__main__':
    sys.exit(main(getopts()))
