[![](https://images.microbadger.com/badges/image/fzinfz/anaconda3.svg)](https://microbadger.com/images/fzinfz/anaconda3)

[Dockerfile](https://github.com/fzinfz/docker-images/blob/master/anaconda3/Dockerfile)

Note: this image run under `root `, use at your own risk.

# Installed kernels
bash_kernel & metakernel_bash ([Installed base/dev tools](https://raw.githubusercontent.com/fzinfz/scripts/master/linux/install.sh))

# Quick start

    docker run --name jupyter \
        --net host \
        -v $PWD:/data -w /data \
        -d --restart unless-stopped \
        -e GEN_CERT=yes \
        fzinfz/anaconda3 \
        jupyter notebook --allow-root --ip=* --port=8888

Visit: https://server_address:8888

# Display startup logs and token

    docker logs jupyter 2>&1 | grep token

# Attach container

    docker exec -it jupyter /bin/bash

# Enable sshd

    source /dev/stdin <<< "$(curl -sSL https://raw.githubusercontent.com/fzinfz/scripts/master/linux/setup_sshd.sh)"
    sshd_change_port 2222
    sshd_allow_root_login && sshd_change_root_password MyRootPassword
    /usr/sbin/sshd 

# Images adding nodejs/kotlin kernels and xfce/i3wm and more
https://hub.docker.com/r/fzinfz/jupyter/