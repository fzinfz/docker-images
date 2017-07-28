license_path=$1

curl -XPUT \
	-u elastic:changeme \
	"http://${IP_ELK_E}:9200/_xpack/license?acknowledge=true" \
       	-H "Content-Type: application/json" \
	-d @${license_path}
