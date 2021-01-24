#!/bin/bash

echo "Domain name certificate: generate localhost.key, localhost.csr, localhost.crt"

if [ "$1" = "" ]
then
  SUBJECT="/C=UA/ST=Kyiv/O=Localhost-Certificates/CN=localhost.local"
else
  SUBJECT=$1
fi

openssl req -new -nodes -newkey rsa:2048 \
  -keyout "$PWD"/certs/localhost.key \
  -out "$PWD"/certs/localhost.csr \
  -subj "$SUBJECT"

openssl x509 -req -sha256 -days 1024 \
  -in "$PWD"/certs/localhost.csr \
  -CA "$PWD"/certs/RootCA.pem \
  -CAkey "$PWD"/certs/RootCA.key -CAcreateserial \
  -extfile "$PWD"/alt_names.ext \
  -out "$PWD"/certs/localhost.crt
