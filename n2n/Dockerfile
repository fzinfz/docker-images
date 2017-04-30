# https://aosekai.net/2012/09/how-to-setup-a-decentralized-overlay-network-using-n2n/

FROM alpine
MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN apk add --update --no-cache alpine-sdk linux-headers openssl-dev && \
    git clone https://github.com/lukablurr/n2n_v2_fork.git && \
    cd /n2n_v2_fork && make SNM=yes && make install PREFIX=/ && \
    rm -rf /n2n_v2_fork
