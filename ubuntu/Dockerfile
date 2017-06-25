FROM ubuntu:rolling
MAINTAINER Ferro Fang <fzinfz@gmail.com>

ENV TERM=xterm
RUN apt-get update && \
    apt-get install -y \
    apt-utils software-properties-common python-software-properties \
    net-tools bridge-utils dnsutils tcpdump  mtr nmap nethogs traceroute bmon iputils-ping nload iftop  \ 
    locate ncdu vim aria2 curl wget htop git pciutils unzip \
    iperf3 sysbench \
    crunch hydra ncrack
