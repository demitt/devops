#!/bin/bash

keytool -exportcert \
    -alias firstCert \
    -keyalg RSA \
    -keystore mykeystore.jks \
    -storepass 123456 \
    -file mycert.cert \
    -rfc \
    -v

# ftc - a textual format (rather than binary) will be used
