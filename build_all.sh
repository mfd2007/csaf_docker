#!/bin/bash

FOLDER=$(pwd)

cd $FOLDER/docker/base
if [[ $# -eq 0 ]]; then
	./build.sh
else
	./build.sh $1
fi

cd $FOLDER/docker/aggregator
./build.sh

cd $FOLDER/docker/checker
./build.sh

cd $FOLDER/docker/provider
./build.sh

cd $FOLDER/docker/uploader
./build.sh

cd $FOLDER/docker/downloader
./build.sh

cd $FOLDER