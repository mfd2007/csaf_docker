#!/bin/bash

cd base
./build.sh
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