#!/bin/sh

if [ -z $REXSTER_HOME ]; then
    echo REXSTER_HOME not set
    exit 1
fi

cd $REXSTER_HOME
$REXSTER_HOME/bin/rexster.sh --stop
$REXSTER_HOME/bin/rexster.sh -s -c config/my_rexster.xml -d

