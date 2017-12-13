#!/bin/bash

source ./init.sh

if [ -z ${IP_Private+x} ];then
	IP_Private=0.0.0.0 
fi

if [ -z ${1+x} ]; then
cat << EOF 
cat script for usage.
Examples:
	./_run.sh rabbitmq/amqp/...(pre-defined docker run, check script for details)
	
EOF
exit 1
fi

export IFS=' '

#TODO: filter ':"
n=${1##*/}
echo "container name: $n"
docker stop $n 
docker rm $n

case $n in
  rabbitmq | amqp ) 
	i="relaxart/rabbitmq-server"
	mode="$mode_d --host host"
	;;
  nfs | nfs4 ) 
	i="itsthenetwork/nfs-server-alpine:latest"
	mode="$mode_d --privileged --host host -v /data:/nfsshare -e SHARED_DIRECTORY=/nfsshare"
	;;	
  mysql | mysql5 )
	i="mysql:5"
	if [ -z ${Password+x} ];then
		echo 'export $Password'
	fi
	mode="$mode_d --net host -v $(pwd)/../docker-data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$Password"
	;;
  mariadb )
	i="mariadb"
        if [ -z ${Password+x} ];then
                echo 'export $Password'
        fi
	mode="$mode_d --net host -v $(pwd)/../docker-data/mariadb:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$Password"
	cmd="--bind-address=$IP_MYSQL"
	;;
  pma | phpmyadmin )
	i="phpmyadmin/phpmyadmin"
	mode="$mode_d --add-host=db:$IP_MYSQL -p $IP_Private:81:80"
	;;
  redis ) 
	i="redis"
	mode="$mode_d --net host -v $(pwd)/../docker-data/redis:/data"
	cmd="redis-server --unixsocket /data/redis.sock --unixsocketperm 755" # sock + http
	;;
  redis_http )
	i="redis"
	mode="$mode_d --net host -v $(pwd)/../docker-data/redis:/data"
	cmd="redis-server --appendonly yes --bind 127.0.0.1"
	;; 	
  mongo | mongodb )
	i="mongo"
	mode="$mode_d --net host -v $(pwd)/../docker-data/mongodb:/data/db"
        cmd="mongod --bind_ip '$IP_Private'" 
	;;
  gcloud )
	i="fzinfz/cloud-sdk:gcloud"
	mode="$mode_d --net host -v /:/host -v $(pwd)/../docker-config/cloud-sdk/gcloud_key.json:/key.json"
	cmd="sh -c \"gcloud auth activate-service-account --key-file=/key.json && sleep infinity\""
	;;
  softether )
        i="siomiz/softethervpn"
        mode="--cap-add NET_ADMIN --net host"
        ;;
  netdata )
	# https://hub.docker.com/r/titpetric/netdata/
	# Http Port: 19999
	i="titpetric/netdata"
	mode="$mode_d --net host --cap-add SYS_PTRACE -v /proc:/host/proc:ro -v /sys:/host/sys:ro"
	;;
  phpfm | fm )
	i="fzinfz/tools:fm"
	mode="$mode_d $mode_host"
	;;
  sni | sniproxy )
	i="mritd/sniproxy"
	mode="$mode_d -p ${IP_Private}:443:443"
	;;
  * )
	i=$1
	mode=$2
	if [ ! -z ${3+x} ]; then
		shift 2
		cmd="sh -c \"$*\""
	fi
esac

docker_run="docker run --name $n $mode $i $cmd"
echo $docker_run
eval $docker_run
echo "docker exec -it $n /bin/bash"
