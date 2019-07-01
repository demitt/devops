#!/bin/bash


# TODO: pass optional precision as arguments
# TODO: add valid rounding (8.555 -> 8.56; 8.666 -> 8.67 etc)

PRECISION=2


first=$1
second=$2

if [ $# != 2 ]; then
    echo "Two arguments are required. Usage: $0 300 17"
    exit 1
fi


integerPart=$(($first/$second))
remainder=$(($first%$second))
decimalPart=0

if [ $remainder -ne 0 ]; then
    decimalPart=$(($remainder*10**$PRECISION/$second))
fi

echo "$first/$second == $integerPart.$decimalPart"
