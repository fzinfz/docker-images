FROM golang

RUN go get -v github.com/cyfdecyf/cow

WORKDIR /go/bin

# Any env variables start with uncapitalized letter will be save to rc file.
ENTRYPOINT exec env | grep '^[a-z]' > rc && sed -i 's/=/ = /g' rc && cow -rc rc

