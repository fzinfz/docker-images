[![](https://images.microbadger.com/badges/image/fzinfz/anaconda3.svg)](https://microbadger.com/images/fzinfz/anaconda3 "Get your own image badge on microbadger.com") 

[Dockerfile](https://github.com/fzinfz/docker-images/blob/master/anaconda3/Dockerfile)

(Note: this image run under `root `, use at your own risk.)

# Installed kernels
- python 3.6.3+ (uwsgi gunicorn django flask bottle hug pyramid & common DB clients)
- python 2.7.9+
- bash: bash_kernel & metakernel_bash ([Installed Tools](https://github.com/fzinfz/scripts/blob/master/install-tools.sh))

Install more kernels yourself: 
https://github.com/jupyter/jupyter/wiki/Jupyter-kernels

# Images adding nodejs/kotlin kernels and xfce/i3wm
https://hub.docker.com/r/fzinfz/jupyter/

# Quick start with HTTP and custom port
```
docker run --name jupyter \
    --net host \
    -v $PWD:/data -w /data \
    -d fzinfz/anaconda3 \
    jupyter notebook --ip=* --allow-root --port=8899
```
Visit: http://server_address:8899

# Quick start with self-signed HTTPS and X11 forwarding
```
docker run --name jupyter \
    --net host \
    -v $PWD:/data -w /data \
    -v $PWD/docker-data/anaconda3:/root \
    --env="DISPLAY" -v $HOME/.Xauthority:/root/.Xauthority:rw \
    -e GEN_CERT=yes  \
    --restart unless-stopped \
    -d fzinfz/anaconda3 \
    jupyter notebook  --ip=* --allow-root
```
     -v /tmp/.X11-unix:/tmp/.X11-unix \

Visit: https://server_address:8888

# Display startup logs and token
    docker logs jupyter

# Attach container
    docker exec -it jupyter /bin/bash

# Start sshd manually
Usually for X11 forwarding or IDE remote debug.

	docker exec -it jupyter /usr/sbin/sshd 
    # default port:2222; root password: MyRootPassword