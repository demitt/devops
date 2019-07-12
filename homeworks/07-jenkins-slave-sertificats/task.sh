#!/bin/bash

KEYSTORE="mykeystore.jks"
KEYSTORE_PASS="123456"
CERT_ALIAS="firstCert"
CERT_FILE="mycert.cert"

if [ ! -f $CERT_FILE ]; then
    echo "File \"$CERT_FILE\" doesn't exist. Exit."
    exit 1
fi

echo "File \"$CERT_FILE\" has been found."

# TODO: check file expired date

certShaFromFile=$(keytool -printcert -file $CERT_FILE | grep -oP "(?<=SHA1: )[A-F\d:]+")

certInfoExisting=$( \
    keytool -list \
        -alias $CERT_ALIAS \
        -keystore $KEYSTORE \
        -storepass $KEYSTORE_PASS \
        -keypass $KEYSTORE_PASS
)

if [ $? == 0 ]; then
    certShaExisting=$(echo "$certInfoExisting" | grep -oP "(?<=\(SHA1\): )([A-F\d:]+)")

    if [ "$certShaFromFile" == "$certShaExisting" ]; then
        echo "The certificate has not been changed. Do nothing."
        exit 0
    fi

    echo "We have new certificate! Lets delete old one."

    keytool -delete \
        -alias $CERT_ALIAS \
        -keystore $KEYSTORE \
        -storepass $KEYSTORE_PASS

else
    echo "Certificate doesn't exist in keystorage. Lets add it."
fi

keytool -importcert \
    -alias $CERT_ALIAS \
    -keystore $KEYSTORE \
    -storepass $KEYSTORE_PASS \
    -file $CERT_FILE \
    -rfc \
    -noprompt

echo "Certificate has been added!"
