# Dockerfile
https://github.com/fzinfz/docker-images/tree/master/jupyter  

# Tags

`latest`: Based on [`fzinfz/anaconda3`](https://hub.docker.com/r/fzinfz/anaconda3/); add adhoc features. [![](https://images.microbadger.com/badges/image/fzinfz/jupyter.svg)](https://microbadger.com/images/fzinfz/jupyter)   

`X`(deleted): based on old [`fzinfz/anaconda3`]; add selenium/firefox, nodejs, jvm/kotlin   
`xfce`:	based on `X`  [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:xfce.svg)](https://microbadger.com/images/fzinfz/jupyter:xfce)  
`i3wm`:	based on `X`, add chromium/vscode & experimental features [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:i3wm.svg)](https://microbadger.com/images/fzinfz/jupyter:i3wm)  
 

# Quick start example for `i3wm` image

    docker run --name jupyter \
        --net host \
        -v $PWD:/host -w /host \
        -d --restart unless-stopped \
        --security-opt seccomp:unconfined \
        -e GEN_CERT=yes \
        fzinfz/jupyter \
        jupyter notebook --ip=* --allow-root --port=8888

# Start `i3wm` VNC server

    docker exec -it jupyter /bin/bash
    ./i3wm-vnc-init.sh

Press `Alt` + `Enter` to start terminal, then type `bash` to use bash shell.
`chromium --no-sandbox` if running as root(default).

# Notes for `xfce` image
Run `tightvncserver` manually to start vnc server.
Fix `Tab` not working: `Application Menu` -> `Settings` -> `Window Manager` -> `Keyboard`: clear `Switch window for same application`

# Custom kernels
https://github.com/jupyter/jupyter/wiki/Jupyter-kernels

# Other Multi-kernel Jupyter images
Go: https://github.com/gopherdata/gophernotes  
Scala - Rust - Erlang - Elixir - LFE - NodeJS - TypeScript - JAVA8/11: 
https://hub.docker.com/r/poad/docker-jupyter  
R - Julie: https://hub.docker.com/r/jupyter/datascience-notebook/  