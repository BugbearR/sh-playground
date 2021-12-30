#!/bin/sh

# from https://qiita.com/ko1nksm/items/dc8f247cdc5b7b58b736

# define octet number prefix
# how to use
#   ${OCT}${var}
[ $((010)) -eq 8 ] && OCT="0" || OCT="8#"

# define compatible od command (return octet number)
if od -A n -t o1 -v /dev/null >/dev/null 2>&1; then
  od_command() { od -A n -t o1 -v; }
elif hexdump -e '16/1 " %03o" "\n"' -v /dev/null >/dev/null 2>&1; then
  od_command() { hexdump -e '16/1 " %03o" "\n"' -v; }
elif od -b -v /dev/null >/dev/null 2>&1; then
  od_command() { od -b -v | while IFS=" " read -r a o; do echo "$o"; done; }
else
  echo "od command not found" >&2
  exit 1
fi

od_command | {
  # value=0
  while IFS= read -r line; do
    eval "set -- $line"
    for oct; do
      printf '\\${oct}"
      # value=$(($value ^ ${OCT}${oct}))
    done
  done
  # printf '%2x\n' "$value"
}
