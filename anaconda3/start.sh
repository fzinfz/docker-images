docker run -d -p 8899:8888 --name jupyter fzinfz/anaconda3 jupyter notebook --ip=* && 
docker logs jupyter
