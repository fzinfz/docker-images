[![](https://images.microbadger.com/badges/image/fzinfz/anaconda3.svg)](https://microbadger.com/images/fzinfz/anaconda3)

[Dockerfile](https://github.com/fzinfz/docker-images/blob/master/anaconda3/Dockerfile)

Note: this image run under `root `, use at your own risk.

# Installed kernels
- python 3.6.3+ (uwsgi gunicorn django flask bottle hug pyramid & common DB clients)
- python 2.7.9+
- bash: bash_kernel & metakernel_bash ([Installed Tools](https://github.com/fzinfz/scripts/blob/master/install-tools.sh))

# Quick start
```
docker run --name jupyter \
    --net host \
    -v $PWD:/data -w /data \
    -d --restart unless-stopped \
    fzinfz/anaconda3 \
    jupyter notebook --allow-root --ip=* --port=8888
```
Visit: http://server_address:8888  
(docker run with `-e GEN_CERT=yes` for https)

# Display startup logs and token
    docker logs jupyter

# Attach container
    docker exec -it jupyter /bin/bash

# Start sshd manually
	docker exec -it jupyter /usr/sbin/sshd 
    # default port:2222; root password: MyRootPassword

# Images adding nodejs/kotlin kernels and xfce/i3wm and more
https://hub.docker.com/r/fzinfz/jupyter/
