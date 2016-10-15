docker ps -a | egrep 'Exited|Created' | awk '{print $1}' | xargs --no-run-if-empty docker rm
