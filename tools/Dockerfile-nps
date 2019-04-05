FROM alpine as builder

RUN wget https://api.github.com/repos/cnlh/nps/releases/latest
RUN cat latest | grep -o https.*linux_amd64_server.tar.gz | xargs wget && \
    tar -zxvf linux_amd64_server.tar.gz && rm -f linux_amd64_server.tar.gz
