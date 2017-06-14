#!/bin/bash

n=ELK_elasticsearch
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	-e http.host=0.0.0.0 -e transport.host=127.0.0.1 \
	-v $(pwd)/../docker-data/$n:/usr/share/elasticsearch/data \
	docker.elastic.co/elasticsearch/elasticsearch:5.4.1

echo Visit http://elastic:changeme@localhost:9200/_cat/health
