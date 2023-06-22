#!/bin/bash

IMAGE_NAME=csaf_base

if [[ $# -eq 0 ]]; then
	echo "Build CSAF base image & compile binaries"
	docker build --no-cache --rm -t $IMAGE_NAME:latest . 
else
	echo "Build CSAF base image & compile binaries from branch $1"
	docker build --no-cache --rm --build-arg TAG=$1 -t $IMAGE_NAME:latest --network=host .
fi

VERSION=$(docker run --rm --entrypoint cat $IMAGE_NAME:latest /version)
docker tag $IMAGE_NAME:latest $IMAGE_NAME:$VERSION 
