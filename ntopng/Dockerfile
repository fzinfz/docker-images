FROM gcc
# MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN apt-get update && apt-get install -y libpcap-dev
RUN git clone https://github.com/ntop/nDPI.git; cd nDPI; ./autogen.sh; make

RUN apt-get install -y groff
RUN git clone https://github.com/ntop/ntopng.git
RUN cd ntopng && \
    ./autogen.sh && \
    ./configure && make && make install

RUN apt-get install -y vim

