#!/bin/sh

RE="$1"
V="$2"

if printf '%s' "$V" | grep -q "$RE"
then
    echo YES
else
    echo NO
fi
