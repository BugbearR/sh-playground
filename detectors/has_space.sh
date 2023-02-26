#!/bin/sh

has_space()
{
    case "$1" in
    *' '* ) return 0
        ;;
    * ) return 1
        ;;
    esac
}

if $(has_space "$1"); then
    echo "yes"
else
    echo "no"
fi
