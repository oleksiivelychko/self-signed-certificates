## Generate self-signed certificates.

1. Generate certificate authority. It will be created in the <strong>certs</strong> directory inside this directory.
```
./generate_ca.sh
```
...or use custom arguments (otherwise, will be applied `/C=UA/CN=Localhost-Root-CA` as default argument):
```
./generate_ca.sh /C=UA/CN=Localhost-Root-CA
```
2. Edit <strong>alt_names.ext</strong> and add/change domains in <strong>[alt_names]</strong> section. Also, add these names to <strong>/etc/hosts</strong>:
```
127.0.0.1 app.local admin.app.local
```
3. Generate domain name certificate. It will be created in the <strong>certs</strong> directory inside this directory.
```
./generate_certs.sh
```
...or use custom arguments (otherwise, will be applied `/C=UA/ST=Kyiv/O=Localhost-Certificates/CN=localhost.local` as default argument):
```
./generate_certs.sh /C=UA/ST=Kyiv/O=Localhost-Certificates/CN=localhost.local
```
4. Import <strong>RootCA.crt</strong> to <strong>chrome://settings/certificates?search=https</strong> in tab <strong>Authorities</strong>
5. In order to re-generate (domains has been added or removed) certificate for domain name follow step 3.

### WARNING! ONLY DEVELOPMENT USE!
