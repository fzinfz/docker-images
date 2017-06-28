#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	--rm -it \
	-v $(pwd)/shadowsocks-xsadmin.conf.d/settings_custom.py:/xsadmin/xsadmin/settings_custom.py \
	-e Mysql_Password=$Password \
	fzinfz/shadowsocks-xsadmin /bin/bash

