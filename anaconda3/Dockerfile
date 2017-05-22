FROM continuumio/anaconda3
MAINTAINER Ferro Fang <fzinfz@gmail.com>

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

# scrapy
RUN  conda install -y scrapy

# Support passing config from `docker run -e`, check https://github.com/jupyter/docker-stacks    
ADD https://github.com/jupyter/docker-stacks/raw/master/base-notebook/jupyter_notebook_config.py /root/.jupyter/

RUN conda config --add channels conda-forge 
RUN conda install pika pyzmq

# Linux Tools for shell
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libzmq3-dev gcc \
    apt-utils software-properties-common python-software-properties \
    net-tools dnsutils tcpdump  mtr nmap nethogs traceroute bmon iputils-ping nload iftop  \
    locate ncdu vim aria2 curl wget htop git pciutils unzip \
    iperf3 sysbench

EXPOSE 8888
