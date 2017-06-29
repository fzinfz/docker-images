Dockerfile: https://github.com/fzinfz/docker-images/blob/master/cow/Dockerfile

COW source code: https://github.com/cyfdecyf/cow/

Any env variables started with an uncapitalized letter will be saved to /go/bin/rc file.

Example for password protected http proxy with shadowsocks as backend
```
docker run \
    -p 7777:7777 \
    -e listen=http://0.0.0.0:7777 \
    -e userPasswd=http_user:http_password \
    -e proxy=ss://aes-256-cfb:ss_password@ss_server:ss_port \
    -d fzinfz/cow
```
