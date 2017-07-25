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

docker run --name $n \
    --net host \
    -v /:/host \
    -e GEN_CERT=yes  \
    --restart unless-stopped \
    -d fzinfz/$image \
    jupyter notebook  --ip=* --allow-root
