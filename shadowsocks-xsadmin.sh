#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	--rm -it \
	-v $(pwd)/shadowsocks-xsadmin.conf.d/settings_custom.py:/data/xsadmin_deploy/xsadmin/xsadmin/settings_custom.py \
	-e Mysql_Password=$Password \
	-e IP_MYSQL=$IP_MYSQL \
	-e ALLOWED_HOST=$ALLOWED_HOST \
	fzinfz/shadowsocks-xsadmin /bin/bash

