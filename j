#!/usr/bin/bash
# j: get json element
# usage: echo "['a', 'b', 'c']" | j 2

# no arguments: print array as lines, [todo: dict as tab-seperated lines]
if [ $# == 0 ]; then
    jq -r '.[]' # -r: raw output
elif [ $# == 1 ]; then  # one argument: get key from stdin
    arg=$@
    # is arg not an integer? than wrap it in quotes
    if ! [[ $arg =~ ^[0-9]+$ ]]; then
        arg='"'$arg'"'
    fi
    jq --raw-output ".[$arg]"
elif [ $# == 2 ]; then  # two arguments: get key from file
    file=$1
    key=$2
    # call j with key on file
    cat $file | j $key
fi
