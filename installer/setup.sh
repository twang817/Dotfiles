#!/bin/bash

export DF=$(cd $(dirname $BASH_SOURCE)/..; pwd)
SETUP_LOG=$DF/logs/setup.log

type tee &> /dev/null && {
    TEE=" | tee -a $SETUP_LOG"
} || {
    TEE=""
}

run_setup_file() {
    eval "{
        echo \# $1
        $1
        echo \# $1 exited with $?
    }" $TEE
}

cd $DF
mkdir -p $(dirname $SETUP_LOG)
: > $SETUP_LOG
for file in $DF/installer/setup.d/*; do
    if [ -x $file ]; then
        run_setup_file $file
    fi
done
