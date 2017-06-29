sh rm_all_stopped.sh
docker images | egrep '<none>' | awk '{print $3}' | xargs --no-run-if-empty docker rmi
