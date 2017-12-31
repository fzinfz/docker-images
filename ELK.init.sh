if [ $0 = 'ELK.init.sh'  ];then
    echo "Usage: source $0"
fi

export ELK_version=6.0.0

export IP_ELK_E=${IP_ELK_E:-"127.0.0.1"}

ELK_install--xpack-license-path() {
    license_path=$1
    
    curl -XPUT \
    -u elastic:changeme \
    "http://${IP_ELK_E}:9200/_xpack/license?acknowledge=true" \
    -H "Content-Type: application/json" \
    -d @${license_path}
}

ELK_elasticsearch() {
    n=${FUNCNAME[0]}
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
    
}

ELK_logstash() {
    n=${FUNCNAME[0]}
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
    
}

ELK_kibana() {
    n=${FUNCNAME[0]}
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
    
}

ELK_packetbeat() {
    n=${FUNCNAME[0]}
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
}