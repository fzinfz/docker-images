#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	--add-host="elasticsearch:$IP_ELK_E" \
       	docker.elastic.co/kibana/kibana:$ELK_version

echo Doc: https://www.elastic.co/guide/en/kibana/current/index.html

echo Visit http://$IP_ELK_K:5601
