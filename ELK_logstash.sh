#!/bin/bash

n="${0%%.*}"
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	--add-host="elasticsearch:127.0.0.1" \
       	docker.elastic.co/logstash/logstash:5.4.1

