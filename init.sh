export docker_run_d='-d --restart unless-stopped'
export docker_run_host='--privileged --cap-add=ALL -it -v /dev:/dev -v /lib/modules:/lib/modules --pid=host --ipc=host --net host -v /:/host'
export dockerfile_apt='--no-install-recommends && rm -r /var/lib/apt/lists/*'

