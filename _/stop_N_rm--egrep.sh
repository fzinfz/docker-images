docker ps  | egrep "$@"	 | awk '{print $1}' | xargs --no-run-if-empty -t -I {} bash -c 'docker stop {} && docker rm {} '
