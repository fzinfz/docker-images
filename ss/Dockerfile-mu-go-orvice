FROM golang

RUN go get -v github.com/orvice/shadowsocks-go/mu 

WORKDIR /go/bin

RUN cp /go/src/github.com/orvice/shadowsocks-go/mu/example.conf config.conf \
    && rm -rf /go/pkg /go/src \
    && sed -i 's/^pass/#pass/'  config.conf 
