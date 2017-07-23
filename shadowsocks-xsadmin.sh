#!/bin/bash

exec 6<>/dev/tcp/127.0.0.1/6379  || echo "redis is not running!"

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

if [ -z $1 ]; then
	db="mysql"
else
	db=$1
fi

shift

mode="--rm -it"
mode_d='-d --restart unless-stopped'

if [ -z ${1+x} ];then
	cmd="/bin/bash"
elif [ $1 = "dev" ];then
	cmd="python manage.py runserver $IP_Private:82"
	mode=$mode_d
elif [ $1 = "run" ]; then
	cmd="uwsgi --http $IP_Private:82"
	mode=$mode_d
else
	cmd=$*
fi

if [ -z $ALLOWED_HOST ];then
	ALLOWED_HOST="*"
fi

docker run --name $n \
	--net host \
	$mode \
	-v $(pwd)/shadowsocks-xsadmin.conf.d/settings_$db.py:/data/xsadmin_deploy/xsadmin/xsadmin/settings_custom.py:rw \
	-e Mysql_Password=$Password \
	-e IP_MYSQL=$IP_MYSQL \
	-e ALLOWED_HOST=$ALLOWED_HOST \
	fzinfz/shadowsocks-xsadmin $cmd

