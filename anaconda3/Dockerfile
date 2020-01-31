FROM continuumio/anaconda3
MAINTAINER Ferro Fang <fzinfz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Support passing config from `docker run -e`, check https://github.com/jupyter/docker-stacks    
ADD https://github.com/jupyter/docker-stacks/raw/master/base-notebook/jupyter_notebook_config.py /root/.jupyter/

# Python kernels & packages
RUN curl -sS https://raw.githubusercontent.com/fzinfz/scripts/master/linux/python.sh  | bash -s -- -i=py_packages,kernel_py27,kernel_bash

# Linux Tools for shell
RUN curl -sS https://raw.githubusercontent.com/fzinfz/scripts/master/linux/install.sh | bash -s -- -p=base,dev -i -u

EXPOSE 8888 2222
