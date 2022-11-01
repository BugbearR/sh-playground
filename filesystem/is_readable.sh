#!/bin/sh
if [ -r "$1" ]; then
    printf "'%s' is readable.\n" "$1"
else
    printf "'%s' is not readable.\n" "$1"
fi
