#!/bin/bash


if [ -z ${amqp_host_ip+x} ]; then
	amqp_host_ip=127.0.0.1
fi

if [ -z ${nfprobe_receiver+x} ]; then
        nfprobe_receiver=$amqp_host_ip
fi

if [ -z ${1+x} ]; then
cat << EOF 
Usage: 
	export amqp_host_ip=<your rabbitmq host ip, default $amqp_host_ip>
	export nfprobe_receiver=<your nfprobe ip, default $nfprobe_receiver> 
	./pmacct <TAG> <RUN_MODE> <COMMAND>
	TAG: ''/latest, dev
	RUN_MODE(docker run parameters): -it, -d, ... 

Examples:
	./pmacct.sh '' '-it --rm' bash
	./pmacct.sh '' '-it --rm' uacctd -V
	./pmacct.sh '' -d nfacctd -f /conf/amqp.conf -l 2056
	./pmacct.sh '' -d pmacctd -f /conf/nfprobe.conf -i ens3
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
	-v $(pwd)/pmacct.conf.d:/conf \
	--add-host="amqp_host:$amqp_host_ip" \
	--add-host="nfprobe_receiver:$nfprobe_receiver" \
	$run_mode \
	fzinfz/pmacct:$tag  sh -c "$*"

