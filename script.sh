#!/bin/bash
echo Starting deploy ocserv 
# Go to current user's home directory

cd ~


echo Install dependency package
sudo rm -f ./installpackage.sh
wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/installpackage.sh

sudo chmod +x ./installpackage.sh
sudo ./installpackage.sh

echo Install Ocserv
sudo rm -f ./ocserv-0.10.4.tar.xz
sudo rm -rf ./ocserv-0.10.4
wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.10.4.tar.xz

tar xvf ocserv-0.10.4.tar.xz 

cd ocserv-0.10.4

./configure

make

sudo make install
sudo rm -f ./ocserv.conf

wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/ocserv.conf
sudo mkdir /etc/ocserv

sudo cp ocserv.conf /etc/ocserv/ocserv.conf

echo Generate Certificates
cd ~
sudo rm -f ./generatecert.sh
wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/generatecert.sh

sudo chmod +x ./generatecert.sh

./generatecert.sh

echo Configure Iptables 
cd ~
sudo rm -f ./configureiptables.sh
wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/configureiptables.sh
sudo chmod +x ./configureiptables.sh
./configureiptables.sh

echo Update Configurations
cd ~
sudo rm -f ./updateconfig.sh
wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/updateconfig.sh
chmod +x ./updateconfig.sh
./updateconfig.sh

echo stop and start ocserv service
sudo service ocserv stop
sudo service ocserv start
