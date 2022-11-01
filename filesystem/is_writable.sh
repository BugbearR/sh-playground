#!/bin/sh
if [ -w "$1" ]; then
    printf "'%s' is writable.\n" "$1"
else
    printf "'%s' is not writable.\n" "$1"
fi
