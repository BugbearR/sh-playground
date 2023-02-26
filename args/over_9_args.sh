#!/bin/sh

set -eu

if [ $# -eq 0 ]; then
    printf "usage: $0 arg1 arg2 ...\n"
    exit 1
fi

# printf "[%s]\n" ${2+x}
# [ -n "${2+x}" ] && printf "%s\n" "-n"
# [ -z "${2+x}" ] && printf "%s\n" "-z"

if [ -n "${1+x}" ]; then
    printf "1:%s\n" "$1"
fi
if [ -n "${2+x}" ]; then
    printf "2:%s\n" "$2"
fi
if [ -n "${3+x}" ]; then
    printf "3:%s\n" "$3"
fi
if [ -n "${4+x}" ] ; then
    printf "4:%s\n" "$4"
fi
if [ -n "${5+x}" ] ; then
    printf "5:%s\n" "$5"
fi
if [ -n "${6+x}" ] ; then
    printf "6:%s\n" "$6"
fi
if [ -n "${7+x}" ] ; then
    printf "7:%s\n" "$7"
fi
if [ -n "${8+x}" ] ; then
    printf "8:%s\n" "$8"
fi
if [ -n "${9+x}" ] ; then
    printf "9:%s\n" "$9"
fi
if [ -z "${10+x}" ] ; then
    printf "10:%s\n" "${10}"
fi
