#!/bin/bash

n="${0%%.*}"
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	--add-host="elasticsearch:127.0.0.1" \
	-v $(pwd)/${n}.conf/pipeline/:/usr/share/logstash/pipeline/ \
       	docker.elastic.co/logstash/logstash:5.4.1

echo Usage: https://www.elastic.co/guide/en/logstash/current/_pulling_the_image.html
echo Logging: http://localhost:9600/_node/?pretty

