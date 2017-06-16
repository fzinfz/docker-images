#!/bin/bash
export IFS=' '

n=${1##*/}
docker stop $n 
docker rm $n

mode_d='-d --restart unless-stopped'
mode_i='-it --rm'

case $n in
  rabbitmq | amqp ) 
	i="relaxart/rabbitmq-server"
	mode=$mode_d	
	;;
  ubuntu ) 
	i="fzinfz/ubuntu"
	mode=$mode_i
	cmd=bash
	;;
  * )
	i=$1
	mode=$2
	shift 2
	cmd=sh -c "$*"
esac

docker run --name $n \
    --net host \
    $mode $i $cmd
