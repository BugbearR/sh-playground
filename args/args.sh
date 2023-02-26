#!/bin/sh

i=0
for arg
do
    i=$((i+1))
    printf '%d:"%s"\n' $i "$arg"
done
