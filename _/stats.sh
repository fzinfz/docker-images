# https://github.com/moby/moby/issues/20973

docker stats $(docker ps --format={{.Names}}) --no-stream


