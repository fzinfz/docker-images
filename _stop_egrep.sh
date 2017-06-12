docker ps  | egrep "$@"	 | awk '{print $1}' | xargs --no-run-if-empty docker stop 
