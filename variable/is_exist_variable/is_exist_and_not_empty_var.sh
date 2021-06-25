#!/bin/sh

unset VAR
[ ${VAR:+x} ]
echo $?
VAR=
[ ${VAR:+x} ]
echo $?
VAR=x
[ ${VAR:+x} ]
echo $?
