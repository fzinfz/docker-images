# https://aosekai.net/2012/09/how-to-setup-a-decentralized-overlay-network-using-n2n/

FROM alpine
MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN apk add --no-cache --virtual .build-deps \
      alpine-sdk linux-headers && \ 
    apk add --no-cache openssl-dev && \
    git clone https://github.com/lukablurr/n2n_v2_fork.git && \
    cd /n2n_v2_fork && make SNM=yes && make install PREFIX=/ && \
    apk del .build-deps && rm -rf /n2n_v2_fork
