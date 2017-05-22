FROM ubuntu:rolling
MAINTAINER Ferro Fang <fzinfz@gmail.com>

ENV TERM=xterm
RUN apt-get update && \
    apt-get install -y \
    net-tools dnsutils tcpdump  mtr nmap nethogs traceroute bmon iputils-ping nload iftop  \ 
    ncdu vim aria2 curl wget htop git pciutils unzip \
    iperf3 sysbench \
    crunch hydra ncrack
