#!/bin/sh

set -e

put_hex8()
{
    #echo $1
    if ! printf '%s' "$1" | grep -q '^[0-9A-Fa-f]\{1,2\}$'
    then
        echo "Bad format." 1>&2
        return 1
    fi
    put_hex8__hex=$(echo '0'$1 | sed -e 's/^.*\(.\{2\}\)$/\1/' | tr 'abcdef' 'ABCDEF')
    put_hex8__dec=$(echo "ibase=16;$put_hex8__hex" | bc)
    put_hex8__oct=$(printf '%03o' $put_hex8__dec)
    printf '\'$put_hex8__oct
}

if [ $# -eq 0 -o "$1" = '-' ]
then
    while read line
    do
        for hex in $line
        do
            put_hex8 $hex
        done
    done
elif printf '%s' "$1" | grep -q '^[0-9A-Fa-f]\{1,2\}$'
then
    for hex
    do
        put_hex8 $hex
    done
else
    cat "$@" | while read line
    do
        for hex in $line
        do
            put_hex8 $hex
        done
    done
fi

