#!/bin/bash

cd base
if [[ $# -eq 0 ]]; then
	./build.sh
else
	./build.sh $1
fi
cd ..

cd aggregator
./build.sh
cd ..

cd checker
./build.sh
cd ..

cd provider
./build.sh
cd ..

cd uploader
./build.sh
cd ..

cd downloader
./build.sh
cd ..