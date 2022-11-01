#!/bin/sh
if [ -f "$1" ]; then
    printf "'%s' is file.\n" "$1"
else
    printf "'%s' is not file.\n" "$1"
fi
