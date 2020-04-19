#!/bin/bash

echo "#### STARTING ROUTE MODIFICATION ####"

yum install iptables iptables-services -y -q

#service iptables-services start
systemctl enable iptables-services

#Route table updates for the host
#Pre Routing changes
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3129
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 3130


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
