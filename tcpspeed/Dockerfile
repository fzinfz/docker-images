FROM centos:7 

RUN yum install -y wget
RUN rm -f install_tcpspeed.sh ; wget http://www.tcpspeed.com/tcpspeed/install_tcpspeed.sh ; chmod +x install_tcpspeed.sh ; ./install_tcpspeed.sh 2>&1 | tee install.log

WORKDIR /xs
RUN chmod +x *.sh
