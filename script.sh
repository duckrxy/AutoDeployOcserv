#!/bin/bash
echo hello
# Go to current user's home directory

cd ~

wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.10.4.tar.xz


tar xvf ocserv-0.10.4.tar.xz 

sudo apt-get update

sudo apt-get install build-essential pkg-config libgnutls28-dev libreadline-dev libseccomp-dev libpam0g-dev libwrap0-dev libnl-nf-3-dev

cd ocserv-0.10.4

#`./configure

#make

#sudo make install

sudo mkdir /etc/ocserv

sudo cp doc/sample.config /etc/ocserv/ocserv.conf
