#!/bin/bash

if [ -z ${1+x} ]; then
cat << EOF 
cat script for usage.
Examples:
	./_run.sh alpine -it sh
	./_run.sh fzinfz/ubuntu '-it --rm' bash
	./_run.sh rabbitmq/amqp/ubuntu/...(pre-defined docker run, check script for details)
	
EOF
exit 1
fi

export IFS=' '

n=${1##*/}
echo "container name: $n"
docker stop $n 
docker rm $n

mode_d='-d --restart unless-stopped'

case $n in
  rabbitmq | amqp ) 
	i="relaxart/rabbitmq-server"
	mode="$mode_d --host host"
	;;
  ubuntu ) 
	i="fzinfz/ubuntu"
	mode="--rm -it --net host"
	cmd="/bin/bash"
	;;
  mysql5 )
	i="mysql:5"
	mode="$mode_d --net host -v $(pwd)/../docker-data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$Password"
	;;
  pma | phpmyadmin )
	i="phpmyadmin/phpmyadmin"
	mode="$mode_d --add-host=db:172.17.0.1 -p 81:80"
	;;
  redis )
	i="redis"
	mode="$mode_d --net host -v $(pwd)/../docker-data/redis:/data"
	cmd="redis-server --appendonly yes"
	;;
  * )
	i=$1
	mode=$2
	shift 2
	cmd="sh -c \"$*\""
esac

docker_run="docker run --name $n $mode $i $cmd"
echo $docker_run
eval $docker_run
