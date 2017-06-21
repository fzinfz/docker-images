#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	--add-host="elasticsearch:$IP_ELK_E" \
       	docker.elastic.co/kibana/kibana:$ELK_version

cat << EOL

Doc: https://www.elastic.co/guide/en/kibana/current/index.html

Login: http://$IP_ELK_K:5601

EOL
