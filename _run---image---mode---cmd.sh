#!/bin/bash

source ./init.sh

if [ -z ${IP_Private+x} ];then
	IP_Private=0.0.0.0 
fi

if [ -z ${1+x} ]; then
cat << EOF 
cat script for usage.
Examples:
	./_run.sh alpine -it sh
	./_run.sh python "--rm -it --net host"
	./_run.sh nginx "-d --net host"
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
  iperf | iperf3 )
        i="fzinfz/tools"
	mode="$mode_d --net host"
	cmd="iperf3 -B $IP_Private -s"
	;;
  miniconda | conda )
	i="continuumio/miniconda"
	mode="--rm -it -v $(pwd)/../docker-data/conda_envs:/opt/conda/envs/ -w /opt/conda/envs"
	cmd="/bin/bash"
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
  unifi )
        i="linuxserver/unifi"
        mode="-v /root/data/docker-images/../docker-data/unifi:/config -e PGID=10001 -e PUID=10001 --net host"
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
  ss | ss-libev )
	i="fzinfz/shadowsocks:ssmanager-sorz"
	mode="$mode_i --net host --entrypoint=/bin/sh"
#	cmd=
	;;
  ss-manager-libev )
	i="easypi/shadowsocks-libev"
	mode="$mode_d --net host"
	cmd="ss-manager -m aes-256-cfb -u --manager-address 127.0.0.1:6001"
	;;
  ss-manager-py )
	i="ritou11/docker-shadowsocks"
	mode="$mode_d --net host --entrypoint=/bin/sh"
#	cmd="ssserver -m aes-256-cfb --manager-address 127.0.0.1:7001"  # not work, ssserver is client of ssmanager here
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
