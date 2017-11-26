#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	-e "discovery.type=single-node" \
	-e ES_JAVA_OPTS="-Xms3g -Xmx3g" \
	docker.elastic.co/elasticsearch/elasticsearch:$ELK_version

#	-v $(pwd)/../docker-data/$n:/usr/share/elasticsearch/data \
	#-e http.host=0.0.0.0 -e transport.host=127.0.0.1 \
	#-e path.repo=/usr/share/elasticsearch/data \
cat << EOL 

Doc: 			https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

Health:			http://elastic:changeme@$IP_ELK_E:9200/_cat/health
List indices:		http://$IP_ELK_E:9200/_cat/indices?v
List all records:	http://$IP_ELK_E:9200/<index_name>/_search?pretty=true&q=*:*&size=3

EOL
