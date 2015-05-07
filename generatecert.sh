#!/bin/bash
mkdir certificates

cd certificates

rm -rf ca.tmpl
rm -rf server.tmpl
rm -rf user.tmpl

wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/ca.tmpl

wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/server.tmpl

wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/user.tmpl

# Update the config files
echo "input server ip or host name:"
read sIP
echo $sIP
sed -i "s/^cn = \"[a-zA-Z0-9. ]*\"/cn = \"${sIP}\"/" server.tmpl

# Generate ca key and cert
certtool --generate-privkey --outfile ca-key.pem

certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem

# Generate server key and cert
certtool --generate-privkey --outfile server-key.pem

certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem

# Generate user key and cert
certtool --generate-privkey --outfile user-key.pem

certtool --generate-certificate --load-privkey user-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template user.tmpl --outfile user-cert.pem

openssl pkcs12 -export -inkey user-key.pem -in user-cert.pem -certfile ca-cert.pem -out user.p12

sudo cp ca-cert.pem /etc/ssl/certs/my-ca-cert.pem

sudo cp server-cert.pem /etc/ssl/certs/my-server-cert.pem

sudo cp server-key.pem /etc/ssl/private/my-server-key.pem

