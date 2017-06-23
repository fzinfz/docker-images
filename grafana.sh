#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	-e "GF_SERVER_HTTP_PORT=3001" \
	-e "GF_SECURITY_ADMIN_PASSWORD=admin" \
	grafana/grafana

# More config [GF_[Section]_Key]
cat << EOL

http://docs.grafana.org/installation/configuration/

EOL
