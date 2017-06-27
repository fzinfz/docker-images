FROM python:3-alpine
MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN apk add --no-cache --virtual .build-deps \
	git && \
    git clone https://github.com/alishtory/xsadmin.git && \
    apk del .build-deps 

WORKDIR xsadmin
RUN pip install -r requirements.txt

