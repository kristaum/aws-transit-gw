FROM python:3.6-slim

#VOLUME /etc/squid

LABEL Name="Transp squid proxy" \
      Department="Infrastructure" \
      Team="Cloud" \
      TeamEmail="christopher.kristao@gmail.com" \
      Compliance="None" \
      ApplicationGroup="cloud" \
      Application="squid"

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    iptables \
    iptables-services \
    squid \
    openssl \
    openssl-devel \
    && apt-get clean autoclean

COPY squid.sh ./ && squid.conf whitelist.txt blacklist.txt /etc/squid/

ENTRYPOINT ["/bin/bash", "squid.sh"]
