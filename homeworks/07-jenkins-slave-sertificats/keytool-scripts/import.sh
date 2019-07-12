#!/bin/bash

keytool -importcert \
    -alias firstCert \
    -file mycert.cert \
    -keystore mykeystore.jks \
    -storepass 123456 \
    -rfc \
    -noprompt \
    -v

# rfc - a textual format (rather than binary) will be used
