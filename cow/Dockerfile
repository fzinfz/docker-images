FROM golang

RUN go get -v github.com/cyfdecyf/cow

RUN  env -i /bin/bash && \
    for c in $(env | cut -d '=' -f 1); do unset $c; done && \
    env | grep -v '^_' | cut -c5- > /go/bin/rc && \
    exit

WORKDIR /go/bin






