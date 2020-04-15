#!/bin/bash

echo "#### STARTING ROUTE MODIFICATION ####"

#enable traffic forwarding across interfaces
sysctl -w net.ipv4.ip_forward=1

#get IP addresses and gateways
#LAN_ADDR=$(hostname -i | cut -d ' ' -f 3)
LAN_GW=$(ip route | grep default | grep eth0 | cut -d ' ' -f 3 | head -1)
#WAN_ADDR=$(hostname -i | cut -d ' ' -f 4)
WAN_GW=$(ip route | grep default | grep eth1 | cut -d ' ' -f 3 | head -1)

#Route changes need to happen before pulls or updates so that it'll egress out the correct interface

#Route Changes for current route table
echo "Add route via $WAN_GW with metric 10"
ip route add default via $WAN_GW dev eth1 metric 10
echo "Add route via $LAN_GW to 10.0.0.0/8"
ip route add 10.0.0.0/8 via $LAN_GW dev eth0
echo "Delete default route via $LAN_GW eth0"
ip route del default via $LAN_GW dev eth0

#Add these to the file for writing
rm /etc/sysconfig/network-scripts/route-eth0
rm /etc/sysconfig/network-scripts/route-eth1
ip route list | grep eth0 >> /etc/sysconfig/network-scripts/route-eth0
ip route list | grep eth1 >> /etc/sysconfig/network-scripts/route-eth1

#yum happens after route table changes to allow for internet connectivity

yum install iptables iptables-services -y -q

#service iptables-services start
systemctl enable iptables-services

#Route table updates for the host
#Pre Routing changes
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3129
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 3130

#ACL Inputs
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3128 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3129 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 3130 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 2376 -j ACCEPT

#write iptables to file
/usr/libexec/iptables/iptables.init save

echo "#### FINISHED ROUTE MODIFICATION ####"

echo "#### START SQUID MODIFICATION ####"

touch /etc/squid/whitelist.txt
touch /etc/squid/blacklist.txt

#Certificate Generation
openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -extensions v3_ca -keyout /etc/squid/ssl_certs/squid_ssl.pem -out /etc/squid/ssl_certs/squid_ssl.pem -subj "/C=XX/ST=XX/L=squid/O=squid/CN=squid"
openssl x509 -in /etc/squid/ssl_certs/squid_ssl.pem -outform DER -out /etc/squid/ssl_certs/squid_ssl.der

cp /etc/squid/ssl_certs/squid_ssl.pem /etc/pki/ca-trust/source/anchors/squid.pem
update-ca-trust extract

chown -R squid:squid /etc/squid

service squid start
systemctl enable squid
