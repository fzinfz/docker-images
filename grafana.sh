#!/bin/bash

n="${0%%.*}"
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	-e "GF_SERVER_HTTP_PORT=3001" \
	-e "GF_SECURITY_ADMIN_PASSWORD=secret" \
	grafana/grafana

# More config [GF_[Section]_Key]
http://docs.grafana.org/installation/configuration/
