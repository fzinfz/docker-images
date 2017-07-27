if [ $0 = 'ELK_init.sh'  ];then
	echo "Usage: source $0" 
fi

export ELK_version=5.4.2

export IP_ELK_E=${IP_ELK_E:-"127.0.0.1"}
