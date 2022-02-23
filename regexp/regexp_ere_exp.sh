#!/bin/sh

RE="$1"
V="$2"

if printf '%s' "$V" | grep -q -E "$RE"
then
    echo YES
else
    echo NO
fi
