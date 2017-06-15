#!/bin/bash

v='latest'

if [ $# -eq 1 ]; then
	eval v='$1'
fi

echo version: $v

docker run --rm -it \
	--net=host \
	-v $(pwd)/pmacct:/host \
	fzinfz/pmacct:$v \
	/bin/bash
