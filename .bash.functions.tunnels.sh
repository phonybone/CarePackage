#!/bin/bash

function ssh-tunnel {
    # general purpose ssh tunnel function, mostly helps for documenting
    local local_port=$1
    local jump_server=$2
    local jump_port=$3
    local tgt_server=$4

    ssh ${tgt_server} -L ${local_port}:${jump_server}:${jump_port}
}
