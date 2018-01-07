FROM ubuntu:14.04
MAINTAINER Ferro Fang <fzinfz@gmail.com>

ENV TERM=xterm
RUN apt update && apt install -y wget

ADD http://download.flowbat.com/install_flowbat_ubuntu.sh  .

RUN chmod +x install_flowbat_ubuntu.sh 
RUN yes | ./install_flowbat_ubuntu.sh
