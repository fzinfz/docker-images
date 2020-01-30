FROM continuumio/anaconda3
MAINTAINER Ferro Fang <fzinfz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Support passing config from `docker run -e`, check https://github.com/jupyter/docker-stacks    
ADD https://github.com/jupyter/docker-stacks/raw/master/base-notebook/jupyter_notebook_config.py /root/.jupyter/

# https://github.com/Calysto/metakernel/tree/master/metakernel_bash
RUN pip install metakernel_bash

# https://github.com/takluyver/bash_kernel
RUN pip install --upgrade pexpect && \
    pip install bash_kernel && \
    python -m bash_kernel.install

# Linux Tools for shell
RUN curl -sS https://raw.githubusercontent.com/fzinfz/scripts/master/linux/install.sh | bash -s -- -p=base,dev -i -u

RUN source /dev/stdin <<< "$(https://raw.githubusercontent.com/fzinfz/scripts/master/linux/python.sh)" && \
    install_packages && install_kernel_py27

EXPOSE 8888 2222