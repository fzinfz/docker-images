[![](https://images.microbadger.com/badges/image/fzinfz/cow.svg)](https://microbadger.com/images/fzinfz/cow "Get your own image badge on microbadger.com")

Dockerfile: https://github.com/fzinfz/docker-images/blob/master/cow/Dockerfile

COW source code: https://github.com/cyfdecyf/cow/

Any env [variables](https://github.com/cyfdecyf/cow/blob/master/doc/sample-config/rc) started with an uncapitalized letter will be saved to /go/bin/rc file.

Example for password protected http proxy with shadowsocks as backend
```
docker run --name cow --net host \
    -e listen=http://0.0.0.0:7777 \
    -e userPasswd=http_user:http_password \
    -e proxy=ss://aes-256-cfb:ss_password@ss_server:ss_port \
    --rm -it fzinfz/cow  -request
```
