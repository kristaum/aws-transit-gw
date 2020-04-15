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

mkdir /etc/squid/ssl_certs

openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -extensions v3_ca -keyout squid_ssl.pem -out /etc/squid/ssl_certs/squid_ssl.pem -subj "/C=XX/ST=XX/L=squid/O=squid/CN=squid"
openssl x509 -in squid_ssl.pem -outform DER -out /etc/squid/ssl_certs/squid_ssl.der
