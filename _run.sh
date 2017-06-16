#!/bin/bash

n=$1
shift
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
	if [ $# -gt 0 ]; then
		mode=$1
		shift
		cmd=sh -c "$*"
	fi
esac

export IFS=' '
docker run --name $n \
    --net host \
    $mode $i sh -c "$cmd" 
