# Base image & basic usages
https://hub.docker.com/r/fzinfz/anaconda3/

# Tags
`nodejs`: 	python 2/3 + bash + nodejs [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:nodejs.svg)](https://microbadger.com/images/fzinfz/jupyter:nodejs "Get your own image badge on microbadger.com")   
`jvm`:	python 2/3 + bash + kotlin  [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:jvm.svg)](https://microbadger.com/images/fzinfz/jupyter:jvm "Get your own image badge on microbadger.com")  
`latest`:	all kernels [![](https://images.microbadger.com/badges/image/fzinfz/jupyter.svg)](https://microbadger.com/images/fzinfz/jupyter "Get your own image badge on microbadger.com")   
`xfce`:	all kernels + vnc + xfce + firefox  [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:xfce.svg)](https://microbadger.com/images/fzinfz/jupyter:xfce "Get your own image badge on microbadger.com")  
`i3wm`:	all kernels + vnc + i3wm + firefox + chromium  [![](https://images.microbadger.com/badges/image/fzinfz/jupyter:i3wm.svg)](https://microbadger.com/images/fzinfz/jupyter:i3wm "Get your own image badge on microbadger.com")

# Dockerfile
https://github.com/fzinfz/docker-images/tree/master/jupyter

# Notes for `xfce` image
Run `tightvncserver` manually to start vnc server.
Fix `Tab` not working: `Application Menu` -> `Settings` -> `Window Manager` -> `Keyboard`: clear `Switch window for same application`

# Notes for `i3wm` image
Run `/i3wm-vnc-init.sh` manually to setup vnc server.
Press `Alt` + `Enter` to start terminal, then type `bash` to use bash shell.
