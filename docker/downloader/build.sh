#!/bin/bash

IMAGE_NAME=csaf_downloader

echo "Build $IMAGE_NAME image"

docker build --rm -t $IMAGE_NAME:latest .

VERSION=$(docker run --rm --entrypoint cat $IMAGE_NAME:latest /version)
docker tag $IMAGE_NAME:latest $IMAGE_NAME:$VERSION 
