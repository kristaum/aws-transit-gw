#!/bin/bash

echo "#### STARTING SQUID INSTALL ####"

yum install squid openssl openssl-devel gcc-c++ -y -q

#Squid Setup
mkdir /etc/squid/ssl_certs

touch /etc/squid/whitelist.txt
touch /etc/squid/blacklist.txt

#Squid Configuration
rm /etc/squid/squid.conf


echo "#### FINISHED SQUID INSTALL ####"
