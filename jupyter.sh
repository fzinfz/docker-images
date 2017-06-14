docker run --name jupyter \
    --net host \
    -v $(pwd)/../:/host \
    -e GEN_CERT=yes  \
    --restart unless-stopped \
    -d fzinfz/anaconda3 \
    jupyter notebook  --ip=*
