FROM ubuntu:16.04
MAINTAINER Ferro Fang <fzinfz@gmail.com>

ENV TERM=xterm
RUN apt-get update && apt-get install -y lsb-release

ADD http://apt.ntop.org/16.04/all/apt-ntop.deb .
RUN dpkg -i apt-ntop.deb

RUN apt-get clean all && apt-get  update && apt-get install -y \
	pfring nprobe ntopng ntopng-data n2disk cento

