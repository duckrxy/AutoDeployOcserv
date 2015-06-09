#!/bin/bash
sudo iptables -F FORWARD
sudo iptables -t nat -A POSTROUTING -s 10.10.0.0/24 -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -s 10.10.0.0/24 -j ACCEPT
sudo mkdir /etc/iptables
sudo touch /etc/iptables/rules.v4
sudo chmod 777 /etc/iptables/rules.v4

sudo iptables-save > /etc/iptables/rules.v4

sudo sed -i "s/^#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/" /etc/sysctl.conf

sudo sysctl -p /etc/sysctl.conf

