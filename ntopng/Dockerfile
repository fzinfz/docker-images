FROM ubuntu:16.04
MAINTAINER Ferro Fang <fzinfz@gmail.com>

ENV TERM=xterm
#RUN apt-get update && apt-get install -y ntopng ntopng-data

ADD http://packages.ntop.org/ubuntu/16.04/x64/ntopng/ntopng_3.1.170608-3009_amd64.deb .
RUN dpkg -i ntopng_3.1.170608-3009_amd64.deb
