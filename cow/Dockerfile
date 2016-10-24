FROM golang

RUN go get -v github.com/cyfdecyf/cow

WORKDIR /go/bin

ENTRYPOINT exec env | grep '^[a-z]' > /go/bin/rc && sed -i 's/=/ = /g' rc && cow -rc rc

