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
RUN curl -sS http://tx.mpio.win:8090/scripts/linux/install.sh | bash -s -- -p=base

RUN conda config --add channels conda-forge && \
    conda install -y pika pyzmq scrapy uwsgi gunicorn django flask bottle hug pyramid python-graphviz && \
    conda install -y pyzmq pymongo pymysql mysql-connector-python psycopg2 sqlite

EXPOSE 8888