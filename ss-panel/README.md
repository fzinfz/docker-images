backup of Desc in: https://hub.docker.com/r/fzinfz/ss-panel/

## Dockerfile
ss-panel: https://github.com/fzinfz/docker-images/blob/master/ss-panel/Dockerfile
ss-go-mu: https://github.com/fzinfz/docker-images/blob/master/ss-go-mu/Dockerfile

## Quick Fresh Setup
### Create EMPTY data directory for mysql
```
mkdir -p /root/data/docker-data/mysql
```
### Start mysql for ss-panel
```
docker run --name mysql \
    -v /root/data/docker-data/mysql:/var/lib/mysql \
    -e MYSQL_USER=sspanel \
    -e MYSQL_PASSWORD=sspanel \
    -e MYSQL_DATABASE=sspanel \
    -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
    -d --restart unless-stopped mysql
```
### Start ss-panel
```
docker run --name ss-panel -p 80:80  \
    --link mysql:mysql \
    -d --restart unless-stopped fzinfz/ss-panel
```
### Import mysql schema
```
docker exec -it ss-panel /bin/bash -c \
    'mysql -h mysql -u sspanel -psspanel sspanel  < /ss-panel/db.sql'
```
### Create ss-panel admin user
```
docker exec -it ss-panel /bin/bash -c 'php xcat createAdmin'
```
### Start redis for shadowsocks-go/mu
```
docker run --name redis --net host -d  --restart unless-stopped redis
iptables -I INPUT -p tcp --dport 6379 -j DROP
iptables-save
```
### Generate random muKey for shadowsocks-go/mu
```
export muKey=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c32`

docker exec -it ss-panel \
    sed -i "s/^muKey.*/muKey ='$muKey'/"  .env
```
### Start shadowsocks-go/mu
```
docker run --name ss-go-mu \
    --net host \
    -d --restart unless-stopped  fzinfz/ss-go-mu \
    /bin/bash -c "\
    sed -i \"s#^url.*#url http://localhost/mu#\" config.conf && \
    sed -i 's/^key.*/key $muKey/'  config.conf && \
    mu"
```
Note: change `localhost` to remote server.
### Insert current shadowsocks-go/mu to ss-panel as first node(Optional)
```
docker exec -it ss-panel mysql -h mysql -u sspanel -psspanel -e \
    "INSERT INTO ss_node VALUES (1,'localhost',1,'localhost','rc4-md5',0,1,'localhost','',0,1);" sspanel
```
Done. 

## Migration
```
docker run --name mysql \
    -v /root/data/docker-data/mysql:/var/lib/mysql \
    -d --restart unless-stopped mysql
```

Refer to `Start ss-panel` section
Refer to `Start redis for shadowsocks-go/mu` section
export muKey=<GET_KEY_FROM `docker exec -it ss-panel cat .env | grep muKey`>
Refer to `Start shadowsocks-go/mu` section


