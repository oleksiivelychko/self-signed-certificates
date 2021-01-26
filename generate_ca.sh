#!/bin/bash

echo "Certificate authority (CA): generate RootCA.pem, RootCA.key, RootCA.crt"

if [ "$1" = "" ]
then
  SUBJECT="/C=UA/CN=Localhost-Root-CA"
else
  SUBJECT=$1
fi

openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 \
  -keyout "$PWD"/certs/RootCA.key \
  -out "$PWD"/certs/RootCA.pem \
  -subj "$SUBJECT"

openssl x509 -outform pem -in "$PWD"/certs/RootCA.pem -out "$PWD"/certs/RootCA.crt
