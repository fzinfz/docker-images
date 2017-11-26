#!/bin/bash

if [ -z ${1+x} ]; then
cat << EOF 
Usage:
	1. Create <folder_name>/Dockerfile[-<tag>] file
	2. ./build.sh <folder_name> [tag]	
Examples: 
	./build.sh jupyter
	./build.sh jupyter jvm
EOF
exit 
fi

if [ -z ${2+x} ]; then
	cmd="docker build -t fzinfz/$1:latest $1"
else
	cmd="docker build -f $1/Dockerfile-$2 -t fzinfz/$1:$2 $1"
fi

echo $cmd
eval $cmd


