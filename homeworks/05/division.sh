#!/bin/bash


# TODO: pass numbers and (optional) precision as arguments
# TODO: add valid rounding


first=300
second=17
precision=2

integerPart=$(($first/$second))
remainder=$(($first%$second))
decimalPart=0

if [ $remainder -ne 0 ]; then
    decimalPart=$(($remainder*10**precision/$second))
fi

echo "$first/$second == $integerPart.$decimalPart"
