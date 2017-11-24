docker_rm_all_stopped() {
    # docker ps -a | egrep 'Exited|Created' | awk '{print $1}' | xargs --no-run-if-empty docker rm
    docker container prune
}

docker_rmi_all() {
    docker rmi $(docker images -q)
}

docker_rmi_all_unsed() {
    docker image prune
}

docker_stop_all() {
    docker kill $(docker ps -q)
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

docker_rmi_all_none() {
    docker_rm_all_stopped
    docker images | egrep '<none>' | awk '{print $3}' | xargs --no-run-if-empty docker rmi

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


mode_d='-d --restart unless-stopped'
mode_host='--privileged --cap-add=ALL -it -v /dev:/dev -v /lib/modules:/lib/modules --pid=host --ipc=host --net host -v /:/host'

docker_run_vim_py() {
    docker run -it --rm -v $(pwd):/src fzinfz/tools:vim-py $1
}

docker_run_bash() {
    docker run -it --rm -v $(pwd):/data $mode_host fzinfz/tools
}

docker_run_golang_rmit(){
    docker run --rm -it -v $PWD:/data  golang /bin/bash
}

docker_run_unifi_d() {
    docker run -d --init --restart unless-stopped \
	-p 8080:8080 -p 8443:8443 -p 3478:3478/udp -p 10001:10001/udp \
	-e TZ='Asia/Shanghai' \
	-e RUNAS_UID0='true' \
	-v $PWD/../docker-data/unifi:/unifi \
	--name unifi jacobalberty/unifi
}


