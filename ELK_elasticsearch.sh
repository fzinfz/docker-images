#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	-e http.host=0.0.0.0 -e transport.host=127.0.0.1 \
	-e path.repo=/usr/share/elasticsearch/data \
	-e ES_JAVA_OPTS="-Xms3g -Xmx3g" \
	-v $(pwd)/../docker-data/$n:/usr/share/elasticsearch/data \
	docker.elastic.co/elasticsearch/elasticsearch:5.4.1

cat << EOL 
Doc: 			https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
Health:			http://elastic:changeme@localhost:9200/_cat/health
List indices:		http://localhost:9200/_cat/indices?v
List all records:	http://localhost:9200/<index_name>/_search?pretty=true&q=*:*&size=3
EOL
