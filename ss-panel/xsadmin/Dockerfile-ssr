FROM python:3-alpine
MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN apk add --no-cache --virtual .build-deps \ 
	git && \
	git clone -b manyuser https://github.com/alishtory/shadowsocksr.git  && \ 
	apk del .build-deps 
WORKDIR shadowsocksr

RUN apk --no-cache add libsodium
RUN pip install requests
RUN python setup.py build && python setup.py install

