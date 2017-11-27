#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

data_path=$(pwd)/../docker-data/$n
mkdir -p $data_path
chmod 777 $data_path

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	-e "discovery.type=single-node" \
	-e ES_JAVA_OPTS="-Xms3g -Xmx3g" \
	-v $data_path:/usr/share/elasticsearch/data \
	docker.elastic.co/elasticsearch/elasticsearch:$ELK_version

cat << EOL 

Doc: 			https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

Health:			http://elastic:changeme@$IP_ELK_E:9200/_cat/health
List indices:		http://$IP_ELK_E:9200/_cat/indices?v
List all records:	http://$IP_ELK_E:9200/<index_name>/_search?pretty=true&q=*:*&size=3

EOL
