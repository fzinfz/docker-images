# Base image & basic usages
https://hub.docker.com/r/fzinfz/anaconda3/

# Kernels
```
  kotlin             /root/.ipython/kernels/kotlin
  javascript         /root/.local/share/jupyter/kernels/javascript
  python2            /root/.local/share/jupyter/kernels/python2
  python3            /opt/conda/share/jupyter/kernels/python3
  bash               /usr/local/share/jupyter/kernels/bash
  metakernel_bash    /usr/local/share/jupyter/kernels/metakernel_bash
```

# Tags
latest:	all kernels  
nodejs:	python 2/3 + bash + nodejs  
jvm: 	python 2/3 + bash + kotlin  
xfce:	all kernels + vnc + xfce + firefox  
i3wm:	all kernels + vnc + i3wm + firefox + chromium  

# Dockerfile
https://github.com/fzinfz/docker-images/tree/master/jupyter

# Notes for `xfce` image
Run `tightvncserver` manually to start vnc server.

# Notes for `i3wm` image
Run `/i3wm-vnc-init.sh` manually to setup vnc server.
Press `Alt` + `Enter` to start terminal, then type `bash` to use bash shell.
