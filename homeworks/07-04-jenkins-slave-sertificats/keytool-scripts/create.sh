#!/bin/bash

keytool -genkeypair \
    -alias firstCert \
    -keyalg RSA \
    -keystore mykeystore.jks \
    -storepass 123456 \
    -dname "CN=FirstName LastName, OU=OrganizationUnit, O=Organization, L=Dnipro, ST=Dnipropetrovska, C=UA" \
    -keypass 1234567890 \
    -v
