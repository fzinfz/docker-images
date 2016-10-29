FROM continuumio/anaconda3
# MAINTAINER Ferro Fang <fzinfz@gmail.com>

# https://github.com/Calysto/metakernel/tree/master/metakernel_bash
RUN pip install metakernel_bash

# https://github.com/takluyver/bash_kernel
RUN pip install --upgrade pexpect && \
    pip install bash_kernel && \
    python -m bash_kernel.install

# Install Python 2.7 env and jupyter kernel
RUN conda create --name=py27 python=2.7 -y
RUN /bin/bash -c "source activate py27 && \
    python2 -m pip install ipykernel && \
    python2 -m ipykernel install --user && \
    source deactivate py27"

# DB support for Python 3
RUN conda install -y pyzmq pymongo pymysql mysql-connector-python psycopg2 sqlite

# Linux Tools for shell
RUN apt-get update && apt-get install -y apt-utils 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y net-tools tcpdump  mtr nmap ncdu vim aria2 libzmq3-dev npm

# https://github.com/n-riesco/ijavascript
RUN /bin/bash -c "source activate py27 && \
    curl -sL https://deb.nodesource.com/setup_6.x |bash - && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs && \
    source deactivate py27"

RUN /bin/bash -c " \
    npm install --unsafe-perm -g ijavascript && \
    ijs --ijs-install=local && \
    jupyter-kernelspec install /root/.local/share/jupyter/kernels/javascript" 

# Support passing config from `docker run -e`, check https://github.com/jupyter/docker-stacks    
ADD https://github.com/jupyter/docker-stacks/raw/master/base-notebook/jupyter_notebook_config.py /root/.jupyter/

EXPOSE 8888

#Testing
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y 
