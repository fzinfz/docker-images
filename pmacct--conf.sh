#!/bin/bash

n="${0%%.*}"
docker stop $n 
docker rm $n

docker run --name ${n}-$1 \
	--net host \
	-v $(pwd)/${n}.conf/:/conf/ \
	fzinfz/pmacct:dev 
	pmacctd  -f /conf/$1.conf -V


