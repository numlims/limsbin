#!/usr/bin/bash
# j: get json element
# usage: echo "['a', 'b', 'c']" | j 2

# no arguments: print array as lines, [todo: dict as tab-seperated lines]
if [ $# == 0 ]; then
    jq -r '.[]' # -r: raw output
else
    arg=$@
    # is arg not an integer? than wrap it in quotes
    if ! [[ $arg =~ ^[0-9]+$ ]]; then
        arg='"'$arg'"'
    fi
    jq ".[$arg]"
fi
