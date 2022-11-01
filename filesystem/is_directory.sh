#!/bin/sh
if [ -d "$1" ]; then
    printf "'%s' is directory.\n" "$1"
else
    printf "'%s' is not directory.\n" "$1"
fi
