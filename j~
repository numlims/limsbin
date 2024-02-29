#!/usr/bin/bash
# j: get json element
# usage: echo "['a', 'b', 'c']" | j 2

arg=$@
# is arg not an integer? than wrap it in quotes
if ! [[ $arg =~ ^[0-9]+$ ]]; then
    arg='"'$arg'"'
fi
jq ".[$arg]"
