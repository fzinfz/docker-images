#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	--cap-add=NET_ADMIN \
	--add-host="elasticsearch:127.0.0.1" \
       	docker.elastic.co/beats/packetbeat:5.4.1

echo Doc: https://www.elastic.co/guide/en/beats/packetbeat/current/index.html

