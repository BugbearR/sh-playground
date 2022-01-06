#!/bin/sh

dump_hex() {
    printf 'string: "%s"\n' "$1"
    printf 'hex: '
    printf "%s" "$1" | od -tx1 -An | sed -e 's/^ *//' | sed -e 's/  */ /g'
}

for i in $(printf ' %03o' $(seq 33 126))
do
#echo $i
CHAR=$(eval 'printf "\'$i'"')
eval 'dump_hex "\'$CHAR'"'
done
