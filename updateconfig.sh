#!/bin/bash

sudo rm -f ./ocservupstart.conf
wget https://raw.githubusercontent.com/duckrxy/AutoDeployOcserv/master/ocservupstart.conf
sudo cp ./ocservupstart.conf /etc/init/ocserv.conf 

cd /etc/init.d
sudo ln -s /lib/init/upstart-job ocserv
cd ~

