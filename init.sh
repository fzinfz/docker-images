export docker_run_d='-d --restart unless-stopped'
export mode_d=$docker_run_d

export mode_i='--rm -it'

export docker_run_host='--privileged --cap-add=ALL -it -v /dev:/dev -v /lib/modules:/lib/modules --pid=host --ipc=host --net host -v /:/host'
export mode_host=$docker_run_host

cat << EOL
dockerfile code snippets:

RUN apt update && apt install -y 
    --no-install-recommends && rm -r /var/lib/apt/lists/*

RUN apk add --no-cache --virtual .build-deps'  
    && apk del .build-deps
EOL

docker_vim_py() {
    docker run -it --rm -v $(pwd):/src fzinfz/tools:vim-py
}

docker_bash() {
    docker run -it --rm -v $(pwd):/data $mode_host -w /data fzinfz/tools
}

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

docker_anaconda3() {
    docker run --rm -it --net host -v $PWD:/src -w /src fzinfz/anaconda3  /bin/bash
}
