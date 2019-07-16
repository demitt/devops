#!/bin/bash

if [ -z $1 ]; then
    echo "Alias is not specified"
    exit 0;
fi

keytool -delete \
    -alias $1 \
    -keystore mykeystore.jks \
    -storepass 123456 \
    -v
