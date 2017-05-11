FROM ubuntu 
MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN apt update && apt install -y software-properties-common 
RUN add-apt-repository ppa:freeradius/stable-3.0 && apt update
RUN apt install -y freeradius nano 
RUN apt install -y mysql-client
