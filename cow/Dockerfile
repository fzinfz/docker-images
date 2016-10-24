FROM golang

RUN go get -v github.com/cyfdecyf/cow

# Save custom env to rc file
RUN  env -i /bin/bash
RUN for c in $(env | cut -d '=' -f 1); do unset $c; done
RUN env | grep -v '^_' | cut -c5- > /go/bin/rc && exit

WORKDIR /go/bin






