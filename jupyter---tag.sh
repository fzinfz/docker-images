#!/bin/bash

if [ -z ${1+x} ]; then
	image="anaconda3"
else
	image="jupyter:$1"
fi

n="${image/:/_}"
echo $n
docker stop $n 
docker rm $n

if [[ -z $docker_run_host ]]; then
	echo 'WARNING: $docker_run_host not set'
fi

docker run --name $n \
    $docker_run_host \
    --add-host="$(hostname):127.0.1.1" \
    -e GEN_CERT=yes  \
    --restart unless-stopped \
    -d fzinfz/$image \
    jupyter notebook  --ip=* --allow-root
