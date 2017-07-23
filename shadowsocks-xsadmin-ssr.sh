#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

mode='-d --restart unless-stopped'

docker run --name $n \
	--net host \
	$mode  \
	-v $(pwd)/shadowsocks-xsadmin.conf.d/config_xsadmin.py:/shadowsocksr/config_xsadmin.py \
	-e SS_XSADMIN_HOST_PORT=$SS_XSADMIN_HOST_PORT \
	-e SS_XSADMIN_API_KEY=$SS_XSADMIN_API_KEY \
	-e SS_XSADMIN_API_SECRET=$SS_XSADMIN_API_SECRET \
	fzinfz/shadowsocks-xsadmin:ssr python xsadmin_server.py


