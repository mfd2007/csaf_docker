#!/bin/bash

IMAGE_NAME=csaf_base

echo "Build CSAF base image & compile binaries"

docker build --no-cache -t $IMAGE_NAME:latest .

VERSION=$(docker run --rm --entrypoint cat $IMAGE_NAME:latest /version)
docker tag $IMAGE_NAME:latest $IMAGE_NAME:$VERSION 
