# Official Doc
https://github.com/v2ray/v2ray-Panel/tree/master/tools

# Setup
```
# create folder to store config data
mkdir v2ray.conf.d && chown www-data:www-data v2ray.conf.d
```

## master
```
# start mongodb
docker run --name mongo --net host -d mongo mongod --bind_ip '127.0.0.1'

# start master containter
wget -P v2ray.conf.d  https://raw.githubusercontent.com/v2ray/v2ray-Panel/master/config/master.json

docker run --rm -it --net host \
    -v $(pwd)/v2ray.conf.d:/usr/local/v2ray-panel/v2ray-Panel/config \
    fzinfz/v2ray-panel ./tools/setup_master.sh
    
docker run --name v2ray-panel-master \
    -d --net host \
    -v $(pwd)/v2ray.conf.d:/etc/v2ray-panel/ \
    fzinfz/v2ray-panel /bin/bash /usr/local/bin/v2ray-panel-master

```

## Node
```
./tools/setup_node.sh
v2ray-panel-node
```

