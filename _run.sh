#!/bin/bash

n=$1
docker stop $n 
docker rm $n

case $n in
  rabbitmq | amqp ) i="relaxart/rabbitmq-server";;
  ubuntu ) i="fzinfz/ubuntu";;
esac
shift

mode='-d --restart unless-stopped'
if [ $# -gt 0 ]; then
	mode=$1
	shift
fi

export IFS=' '
docker run --name $n \
    --net host \
    $mode $i sh -c "$*" 
