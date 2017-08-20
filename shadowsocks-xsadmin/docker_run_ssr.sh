#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

mode_d='-d --restart unless-stopped'
mode_i='--rm -it'

docker run --name $n \
	--net host \
	--cap-add=NET_ADMIN \
	$mode_d  \
	-v $(pwd)/ssr-config_xsadmin.py:/shadowsocksr/config_xsadmin.py \
	-v $(pwd)/ssr-user-config-origin.json:/shadowsocksr/user-config.json \
	-e SS_XSADMIN_HOST_PORT=$SS_XSADMIN_SERVER \
	-e SS_XSADMIN_API_KEY=$SS_XSADMIN_API_KEY \
	-e SS_XSADMIN_API_SECRET=$SS_XSADMIN_API_SECRET \
	fzinfz/shadowsocks-xsadmin:ssr python xsadmin_server.py


