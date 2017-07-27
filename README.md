# Dockerhub Images
https://hub.docker.com/r/fzinfz

# Dockerfile and sample run scripts
https://github.com/fzinfz/docker-images

## Usage of .sh scripts
Some enviorment variables should be set manually or by running:
https://github.com/fzinfz/scripts/blob/master/init_bashrc.sh#L5

## Naming rules
`_manage.d` contains scripts for docker management.  

`./_build.sh` to show docker build commands.  
Run and edit `_run.sh` to customize pre-defined docker run commands.  

Folders end with `.conf.d` are for config files;   
other folders are for `Dockerfile` files and maybe `README.md`.
