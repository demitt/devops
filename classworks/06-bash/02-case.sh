#!/bin/bash


name=$1

if [ -z $name ]; then
    echo "Требуется имя"
    exit 1;
fi

case $name in
    "Вася")	out="На стойку";;
    "Петя")	out="Отдыхать";;
    "Коля")	out="На завод";;
    *) out="Таких не знаем, сейчас милицию вызову";;
esac

echo "$out"
