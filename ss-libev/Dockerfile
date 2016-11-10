FROM debian:jessie

RUN sh -c 'printf "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list' && \
    apt-get update && \
    apt-get -t jessie-backports install -y  shadowsocks-libev && \
    apt-get clean
