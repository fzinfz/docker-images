docker run \
	--net host -it \
	-v $(pwd)/shadowsocks.conf.d/panel-go-linexjlin.config.json:/go/src/github.com/linexjlin/ss-web-manager/config.json \
	-v $(pwd)/../docker-data/redis/redis.sock:/go/src/github.com/linexjlin/ss-web-manager/redisDB/redis.sock \
	fzinfz/shadowsocks:panel-go-linexjlin

