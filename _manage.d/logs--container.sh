docker inspect -f {{.LogPath}} $1 | xargs vi
