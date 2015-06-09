#!/bin/bash
echo Starting deploy ocserv 
# Go to current user's home directory

cd ~


echo Install dependency package

wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/installpackage.sh

sudo chmod +x ./installpackage.sh
sudo ./installpackage.sh

echo Install Ocserv

wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.10.4.tar.xz

tar xvf ocserv-0.10.4.tar.xz 

cd ocserv-0.10.4

./configure

make

sudo make install

wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/ocserv.conf
sudo mkdir /etc/ocserv

sudo cp ocserv.config /etc/ocserv/ocserv.conf

echo Generate Certificates
cd ~
wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/generatecert.sh

sudo chmod +x ./generatecert.sh

./generatecert.sh

echo Configure Iptables 
cd ~
wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/configureiptables.sh
sudo chmod +x ./configureiptables.sh
./configureiptables.sh
