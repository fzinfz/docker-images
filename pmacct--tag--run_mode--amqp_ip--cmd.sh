#!/bin/bash

if [ -z ${1+x} ]; then
cat << EOF 
Usage: ./pmacct--tag--run_mode--amqp_ip--cmd.sh <TAG> <RUN_MODE> <AMQP_IP> <COMMAND>
	TAG: ''/latest, dev
	RUN_MODE: it, d, ...
	AMQP_IP: ''/127.0.0.1, your rabbitmq host ip

Examples:
	./pmacct--tag--run_mode--amqp_ip--cmd.sh '' '-it --rm' '' bash
	./pmacct--tag--run_mode--amqp_ip--cmd.sh '' -it '' pmacctd -V
	./pmacct--tag--run_mode--amqp_ip--cmd.sh dev -d 172.16.0.1 pmacctd -f /conf/amqp.conf -i ens3
EOF
exit 1
fi

tag=$1
if [ "$tag" = "" ]; then
	tag="latest"
fi

run_mode=$2

amqp_host_ip=$3
if [ "$amqp_host_ip" = "" ]; then
	amqp_host_ip="127.0.0.1"
fi

program=${4##*/}
n="pmacct-${program}"
docker stop $n 
docker rm $n

shift 3
export IFS=' '
docker run --name ${n} \
	--net host \
	-v $(pwd)/pmacct.conf:/conf \
	--add-host="amqp_host:$amqp_host_ip" \
	$run_mode \
	fzinfz/pmacct:$tag  sh -c "$*"

