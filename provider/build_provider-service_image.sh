#!/bin/bash

if [ -d "./csaf_distribution" ]; then
	echo "ATTENTION: Folder "./csaf_dsitribution" will be deleted."
	read -p "Are you sure? (y/n)" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
    	rm -rf ./csaf_distribution
	else
		echo "Image have not been build."
		exit 0
	fi
fi

TAG=$1
if [ -z "$TAG" ]
then
    echo "Cloning latest version"
    git clone https://github.com/csaf-poc/csaf_distribution.git >/dev/null 2>&1
else
    echo "Cloning TAG $TAG"
    git clone --branch $TAG https://github.com/csaf-poc/csaf_distribution.git >/dev/null 2>&1
    if [ $? -ne 0 ]
	then
		echo "TAG $TAG not found. Cloning latest version"
		git clone https://github.com/csaf-poc/csaf_distribution.git >/dev/null 2>&1
	fi
fi

cd csaf_distribution
VERSION=$(git log -1 --format="%at" | xargs -I{} date -d @{} +%Y-%m-%d_%H-%M-%S)
cd ..

docker build -t csaf-provider-service:$VERSION .

docker tag csaf-provider-service:$VERSION csaf-provider-service:latest