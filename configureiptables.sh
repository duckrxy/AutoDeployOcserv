#!/bin/bash
iptables -t nat -A POSTROUTING -s 10.10.0.0/24 -o eth0 -j MASQUERADE
iptables -A FORWARD -s 10.10.0.0/24 -j ACCEPT
mkdir /etc/iptables
touch /etc/iptables/rules.v4
chmod 777 /etc/iptables/rules.v4

iptables-save > /etc/iptables/rules.v4

sed -i "s/^#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/"

sysctl -p /etc/sysctl.conf

