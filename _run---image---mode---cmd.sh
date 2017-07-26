#!/bin/bash

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

mode_d='-d --restart unless-stopped'
mode_privileged='--privileged --cap-add=ALL -it -v /dev:/dev -v /lib/modules:/lib/modules --pid=host --ipc=host'

case $n in
  rabbitmq | amqp ) 
	i="relaxart/rabbitmq-server"
	mode="$mode_d --host host"
	;;
  tools ) 
	i="fzinfz/tools"
	mode="--rm -it $docker_run_host"
	cmd="/bin/bash"
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
  mysql5 )
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
	cmd="redis-server --appendonly yes --bind 127.0.0.1"
	;;
  gcloud )
	i="fzinfz/cloud-sdk:gcloud"
	mode="$mode_d --net host -v /:/host -v $(pwd)/../docker-config/cloud-sdk/gcloud_key.json:/key.json"
	cmd="sh -c \"gcloud auth activate-service-account --key-file=/key.json && sleep infinity\""
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
