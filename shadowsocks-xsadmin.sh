#!/bin/bash

echo make sure mysql and redis are running

if [ -z $IP_Private ];then
	IP_Private=0.0.0.0
fi

if [ -z $IP_MYSQL ];then
	IP_MYSQL=127.0.0.1
fi

if [ -z $Password ];then
	Password="xsadmin"
fi

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

mode="--rm -it"
mode_d='-d --restart unless-stopped'

if [ -z ${1+x} ];then
	cmd="/bin/bash"
elif [ $1 = "dev" ];then
	cmd="python manage.py runserver $IP_Private:82"
	mode=$mode_d
elif [ $1 = "run" ]; then
	cmd="uwsgi --http $IP_Private:82 --master --processes 1 --threads 2 --wsgi-file xsadmin/wsgi.py --check-static /data/xsadmin_deploy/xsadmin/static"
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
	-v $(pwd)/shadowsocks-xsadmin.conf.d/settings_mysql.py:/data/xsadmin_deploy/xsadmin/xsadmin/settings_custom.py:rw \
	-e Mysql_Password=$Password \
	-e IP_Private=$IP_Private \
	-e IP_MYSQL=$IP_MYSQL \
	-e ALLOWED_HOST=$ALLOWED_HOST \
	-e GEE_ID=$GEE_ID \
	-e GEE_KEY=$GEE_KEY \
	fzinfz/shadowsocks-xsadmin:ssh $cmd

