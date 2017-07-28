# Installed kernels
- python 3.6.0+ (Include scrapy & DB clients: pyzmq pymongo pymysql mysql-connector-python psycopg2 sqlite)
- python 2.7.13+
- bash: bash_kernel & metakernel_bash ([Installed Tools](https://github.com/fzinfz/scripts/blob/master/install-tools.sh))

## To install more kernels
https://github.com/ipython/ipython/wiki/IPython-kernels-for-other-languages

### Images adding nodejs & kotlin kernels
https://hub.docker.com/r/fzinfz/jupyter/

# Quick start in Detached mode
```
docker run --name jupyter -p 8899:8888 -d fzinfz/anaconda3 \
    jupyter notebook --ip=* --allow-root
```
Visit: http://server_address:8899

# Quick start in Detached mode with token protection and HTTPS
```
docker run --name jupyter \
    --net host \
    -v /root:/host \
    -e GEN_CERT=yes  \
    --restart unless-stopped \
    -d fzinfz/anaconda3 \
    jupyter notebook  --ip=* --allow-root
```    
Visit: https://server_address:8888

# Display startup logs and token
`docker logs jupyter`

# Attach container
`docker exec -it jupyter /bin/bash`

# Start sshd
`docker exec -it jupyter /usr/sbin/sshd`  
on client: `ssh -p 2222 root@$IP_Jupyter_Server` (root password: MyRootPassword)
