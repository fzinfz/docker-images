FROM python:3
MAINTAINER Ferro Fang <fzinfz@gmail.com>

RUN mkdir /data && cd /data && \
	git clone https://github.com/alishtory/xsadmin_deploy.git && \
    cd xsadmin_deploy && \
	git clone https://github.com/alishtory/xsadmin.git

WORKDIR /data/xsadmin_deploy/xsadmin
RUN pip install -r requirements.txt
RUN chmod +x *.py *.sh
RUN apt update && apt install -y vi
