#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	--cap-add=NET_ADMIN \
	--add-host="elasticsearch:127.0.0.1" \
       	docker.elastic.co/beats/packetbeat:$ELK_version

cat << EOL
Doc: https://www.elastic.co/guide/en/beats/packetbeat/current/index.html

Sample dashboard: https://www.elastic.co/guide/en/beats/packetbeat/current/packetbeat-sample-dashboards.html
docker exec -it $n ./scripts/import_dashboards -user elastic -pass changeme
EOL

