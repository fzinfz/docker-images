FROM golang as builder

RUN go get -v github.com/cyfdecyf/cow


FROM debian
# alpine test fail: /bin/sh: ./cow: not found

RUN mkdir /root/.cow
WORKDIR /root/.cow/

COPY --from=builder /go/bin/cow .
EXPOSE 7777

# Any env variables started with an uncapitalized letter will be saved to rc file.
RUN echo "#!/bin/sh\nexec env | grep '^[a-z]' > rc && sed -i 's/=/ = /g' rc && ./cow \"\$*\" " > entrypoint.sh && chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

