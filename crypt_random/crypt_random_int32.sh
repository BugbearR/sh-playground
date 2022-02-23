#!/bin/sh

crypt_random_int32()
{
    crypt_random_int32__hex=$(dd if=/dev/urandom bs=4 count=1 2>/dev/null | od -A n -t x1 | sed -e 's/ //g' | tr 'abcdef' 'ABCDEF')
    echo "ibase=16;$crypt_random_int32__hex" | bc
}

echo $(crypt_random_int32)
