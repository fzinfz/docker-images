#!/bin/bash

mode_d='-d --restart unless-stopped'
mode_host="--privileged --user=root --cap-add=ALL \
    --pid=host --ipc=host --net host \
	-v /dev:/dev -v /lib/modules:/lib/modules \
    -v /boot:/boot -v /:/host"

docker_run_rmit_host--image---cmd() {
    docker run --rm -it $mode_host \
        -v $PWD:/data -w /data \
        --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
        $*
}

docker_update_restart_unless_stopped--container(){
docker container update nfs --restart unless-stopped
}

docker_install() {
	curl -fsSL get.docker.com | sh
}

docker_install_minikube() {
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl
    chmod +x minikube kubectl
    sudo mv minikube /usr/local/bin/
    mv kubectl /usr/local/bin/
}

docker_install_CE_on_RHEL() {
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum makecache fast
    sudo yum -y install docker-ce
    sudo systemctl start docker
}

docker_export--path--image() {
    docker save -o $1 $2
}


docker_import--path() {
    docker load -i $1
}


docker_rm_all_stopped() {
    # docker ps -a | egrep 'Exited|Created' | awk '{print $1}' | xargs --no-run-if-empty docker rm
    docker container prune
}

docker_rmi_all() {
    docker rmi $(docker images -q)
}

docker_rmi_all_unused() {
     docker image prune
}

docker_rmi_all_none() {
    docker_rm_all_stopped
    docker images | egrep '<none>' | awk '{print $3}' | xargs --no-run-if-empty docker rmi
}

docker_stop_all() {
    docker kill $(docker ps -q)
}

docker_log_save--container--path(){
    docker inspect --format='{{.LogPath}}' $1 > $2
}

docker_logs--container--regex() {
    docker logs $1  2>&1 | grep -P $2
}

docker_rm_all() {
    sh stop_all.sh
    docker rm $(docker ps -a -q)
}

docker_clean_all() {
    docker system prune
}

docker_stop_N_rm--egrep() {
    docker ps  | egrep "$@" | \
    awk '{print $1}' | \
    xargs --no-run-if-empty -t -I {} bash -c 'docker stop {} && docker rm {} '
}

docker_kill_N_rm--container() {
    docker kill $1
    docker rm $1
}

docker_logs--container() {
 docker inspect -f {{.LogPath}} $1 | xargs vi

}


docker_stats() {
     # https://github.com/moby/moby/issues/20973
    docker stats $(docker ps --format={{.Names}}) --no-stream

    printf "\nMemory:\n"
    # copied from https://pastebin.com/xzu1VK6Y
    for line in `docker ps | \
        awk '{print $1}' | grep -v CONTAINER`; do docker ps | grep $line | awk '{printf $NF" "}' && \
        echo $(( `cat /sys/fs/cgroup/memory/docker/$line*/memory.usage_in_bytes` / 1024 / 1024 ))MB ; \
    done
}

docker_run_vim() {
    docker_run_rmit_host--image---cmd --entrypoint vim haron/vim $1
}

docker_run_vim_py() {
    docker_run_rmit_host--image---cmd --entrypoint vim fedeg/python-vim $1
}

docker_run_bash() {
    docker_run_rmit_host--image---cmd fzinfz/tools
}

docker_run_unifi_d() {
    docker stop unifi && docker rm unifi

    docker run -d --init --restart unless-stopped \
	-p 8080:8080 -p 8443:8443 -p 3478:3478/udp -p 10001:10001/udp \
	-e TZ='Asia/Shanghai' \
	-e RUNAS_UID0='true' \
	-v $PWD/../docker-data/unifi:/unifi \
	--name unifi jacobalberty/unifi
}

docker_run_unifi_d() {
    docker create \
    --name=plex \
    --net=host \
    -e VERSION=latest \
    -e PUID=1 -e PGID=0 \
    -e TZ=Asia/Shanghai \
    -v $PWD/plex_config:/config \
    -v $PWD/movies:/data/movies \
    linuxserver/plex
}