#!/bin/bash

IMAGE_NAME=csaf_provider

echo "Build $IMAGE_NAME image"

docker build -t $IMAGE_NAME:latest .

VERSION=$(docker run --rm --entrypoint cat $IMAGE_NAME:latest /version)
docker tag $IMAGE_NAME:latest $IMAGE_NAME:$VERSION 
