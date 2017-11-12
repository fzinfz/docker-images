Base image & basic usages: https://hub.docker.com/r/fzinfz/anaconda3/  
Dockerfile: https://github.com/fzinfz/docker-images/tree/master/jupyter  

# Tags

`latest`: python 2/3 + bash + selenium/firefox + nodejs + kotlin [![](https://images.microbadger.com/badges/image/fzinfz/jupyter.svg)](https://microbadger.com/images/fzinfz/jupyter "Get your own image badge on microbadger.com")   
`xfce`:	based on `latest`  [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:xfce.svg)](https://microbadger.com/images/fzinfz/jupyter:xfce "Get your own image badge on microbadger.com")  
`i3wm`:	based on `latest`, add chromium [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:i3wm.svg)](https://microbadger.com/images/fzinfz/jupyter:i3wm "Get your own image badge on microbadger.com")

# Quick start example for `i3wm` image
```
docker run --name jupyter \
    --net host \
    -v /:/host \
    -e GEN_CERT=yes  \
    --restart unless-stopped \
    --security-opt seccomp:unconfined \
    -d fzinfz/jupyter:i3wm \
    jupyter notebook  --ip=* --allow-root

# Start VNC server
docker exec -it jupyter /bin/bash
./i3wm-vnc-init.sh
```

Press `Alt` + `Enter` to start terminal, then type `bash` to use bash shell.
`chromium --no-sandbox` if running as root(default).

# Notes for `xfce` image
Run `tightvncserver` manually to start vnc server.
Fix `Tab` not working: `Application Menu` -> `Settings` -> `Window Manager` -> `Keyboard`: clear `Switch window for same application`
