export docker_run_d='-d --restart unless-stopped'
export mode_d=$docker_run_d

export mode_i='--rm -it'

export docker_run_host='--privileged --cap-add=ALL -it -v /dev:/dev -v /lib/modules:/lib/modules --pid=host --ipc=host --net host -v /:/host'
export mode_host=$docker_run_host

cat << EOL
dockerfile code snippets:
apt install -y * --no-install-recommends && rm -r /var/lib/apt/lists/*'

apk add --no-cache --virtual .build-deps'  && \
&& apk del .build-deps
EOL

alias vim-py='docker run -it --rm -v $(pwd):/src fzinfz/tools:vim-py'
alias my-bash='docker run -it --rm -v $(pwd):/data $mode_host fzinfz/tools'
