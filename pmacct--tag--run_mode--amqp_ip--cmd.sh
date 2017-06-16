#!/bin/bash

if [ -z ${1+x} ]; then
cat << EOF 
Usage: 
	export amqp_host_ip=<your rabbitmq host ip, default 127.0.0.1>
	./pmacct--tag--run_mode--amqp_ip--cmd.sh <TAG> <RUN_MODE> <COMMAND>
	TAG: ''/latest, dev
	RUN_MODE: it, d, ...

Examples:
	./pmacct.sh '' '-it --rm' bash
	./pmacct.sh '' '-it --rm' pmacctd -V

	export amqp_host_ip=172.16.0.1
	./pmacct.sh '' '-it --rm' pmacctd -f /conf/amqp.conf -i ens3		
EOF
exit 1
fi

tag=$1
if [ "$tag" = "" ]; then
	tag="latest"
fi

run_mode=$2

if [ "$amqp_host_ip" = "" ]; then
	amqp_host_ip="127.0.0.1"
fi

program=${3##*/}
n="pmacct-${program}"
docker stop $n 
docker rm $n

shift 2
export IFS=' '
docker run --name ${n} \
	--net host \
	-v $(pwd)/pmacct.conf:/conf \
	--add-host="amqp_host:$amqp_host_ip" \
	$run_mode \
	fzinfz/pmacct:$tag  sh -c "$*"

