#!/bin/bash


search="Dmytro"


fileName=$1

if [ -z "$fileName" ]; then
    echo "File name is not specified. Usage: $0 filename"
    exit 1
fi

if [ ! -f  "$fileName" ]; then
    echo "File does not exist"
    exit 1
fi


if [ $(grep $search $fileName) ]; then
    echo "Found"
else
    echo "Not found"
    echo "$search" >> $fileName
fi

