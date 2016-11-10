FROM alpine

RUN apk update && \
    apk add --no-cache go git && \
    env GOPATH=/go go get github.com/xtaci/kcptun/client && \
    apk del go git && \
    rm -rf /var/cache/apk/*

WORKDIR /go/bin
ENTRYPOINT ["/go/bin/client"]
