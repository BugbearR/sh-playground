#!/bin/sh

set -eu

val1=${1:-Hello world}
printf "val1=%s\n" "$val1"

val2=${val2:-Hello world}
printf "val2=%s\n" "$val2"

# Hello: not found
# ${val3:=Hello world}

: ${val3:=Hello world}
printf "val3=%s\n" "$val3"
