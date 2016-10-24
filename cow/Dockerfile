FROM golang

RUN go get -v github.com/cyfdecyf/cow

WORKDIR /go/bin

# Save custom env to rc file
#RUN  env | grep '^[a-z]' > /go/bin/rc && sed -i 's/=/ = /g' rc
