#!/bin/bash
echo Starting deploy ocserv 
# Go to current user's home directory

cd ~


echo Install dependency package

wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/installpackage.sh

sudo chmod +x ./installpackage.sh
sudo ./installpackage.sh

#sudo apt-get update

#sudo apt-get install build-essential pkg-config libgnutls28-dev libreadline-dev libseccomp-dev libpam0g-dev libwrap0-dev libnl-nf-3-dev

#sudo apt-get install gnutls-bin
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
