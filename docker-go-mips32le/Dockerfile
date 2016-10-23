# Modified for LE version. 
# Source code from: http://conoroneill.net/three-ways-to-build-go-14-binaries-for-mips32-onion-omega-golang/

FROM alpine:3.3

ENV GOLANG_VERSION 1.4.2
ENV GOLANG_SRC_URL https://github.com/gomini/go-mips32.git
ENV GOOS linux
ENV GOARCH mips32le
ENV GOROOT /usr/local/go

RUN set -ex \
        && apk add --no-cache --virtual .build-deps \
        bash \
        git \
        file \
        ca-certificates \
        gcc \
        musl-dev \
        openssl \
        openssh 
        
RUN cd /usr/local/ \
        && git clone "$GOLANG_SRC_URL" go

RUN cd /usr/local/go/src \
        && ./make.bash \
        \
        && apk del .build-deps

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN rm -rf "$GOROOT/src"
RUN rm -rf "$GOROOT/test"
RUN rm -rf "$GOROOT/doc"
RUN mkdir -p "$GOPATH/src" "$GOPATH/pkg" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH/src
