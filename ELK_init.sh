if [ $0 = 'ELK_init.sh'  ];then
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
