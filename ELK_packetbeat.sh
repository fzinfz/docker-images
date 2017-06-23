#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	--cap-add=NET_ADMIN \
	--privileged \
	--add-host="elasticsearch:$IP_ELK_E" \
	-v $(pwd)/ELK_packetbeat.conf.d/packetbeat.yml:/usr/share/packetbeat/packetbeat.yml \
       	docker.elastic.co/beats/packetbeat:$ELK_version

cat << EOL

exporting data to elasticsearch: $IP_ELK_E

Doc: https://www.elastic.co/guide/en/beats/packetbeat/current/index.html

Sample dashboard: https://www.elastic.co/guide/en/beats/packetbeat/current/packetbeat-sample-dashboards.html
docker exec -it $n ./scripts/import_dashboards -user elastic -pass changeme

EOL

