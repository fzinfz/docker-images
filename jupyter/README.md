# Dockerfile
https://github.com/fzinfz/docker-images/tree/master/jupyter  

# Tags

`latest`: Based on [`fzinfz/anaconda3`](https://hub.docker.com/r/fzinfz/anaconda3/), add selenium/firefox, nodejs, jvm/kotlin [![](https://images.microbadger.com/badges/image/fzinfz/jupyter.svg)](https://microbadger.com/images/fzinfz/jupyter)   
`xfce`:	based on `latest`  [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:xfce.svg)](https://microbadger.com/images/fzinfz/jupyter:xfce)  
`i3wm`:	based on `latest`, add chromium/vscode & experimental features [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:i3wm.svg)](https://microbadger.com/images/fzinfz/jupyter:i3wm)  
`tf-gpu`: based on [`jupyter/scipy-notebook`](https://github.com/jupyter/docker-stacks/#visual-overview), add tensorflow-gpu & keras [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:tf-gpu.svg)](https://microbadger.com/images/fzinfz/jupyter:tf-gpu)  

# Quick start example for `i3wm` image

    docker run --name jupyter \
        --net host \
        -v $PWD:/host -w /host \
        -d --restart unless-stopped \
        --security-opt seccomp:unconfined \
        fzinfz/jupyter:i3wm \
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
Scala - Haskell - Rust - Elm - Elixir - Swift - Kotlin: 
https://hub.docker.com/r/poad/docker-jupyter-multi-kernel/
R - Julie: https://hub.docker.com/r/jupyter/datascience-notebook/  
JAVA 10 - https://hub.docker.com/r/cbuctok/ijava/
