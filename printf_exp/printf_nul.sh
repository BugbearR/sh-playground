#!/bin/sh

# POSIX doesn't have "\x" prefix
printf "\\000" >printf_nul.bin
od -tx1 printf_nul.bin
