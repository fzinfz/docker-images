#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
	--net host \
	-d --restart unless-stopped \
	-e amqp_host="$IP_AMQP" \
	-e amqp_vhost="/" \
	-e amqp_user=guest \
	-e amqp_passwd=guest \
	-e CONFIG_RELOAD_AUTOMATIC=true \
	-e IP_ELK_E=$IP_ELK_E \
	--add-host="elasticsearch:$IP_ELK_E" \
	-v $(pwd)/${n}.conf.d/pipeline/:/usr/share/logstash/pipeline/ \
       	docker.elastic.co/logstash/logstash:$ELK_version 

cat << EOL

Doc: https://www.elastic.co/guide/en/logstash/current/_pulling_the_image.html

Check Status: http://$IP_ELK_L:9600/_node/?pretty

EOL

