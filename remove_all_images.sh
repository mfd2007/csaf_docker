#!/bin/bash

docker rmi $(docker images 'csaf_base')
docker rmi $(docker images 'csaf_provider')
docker rmi $(docker images 'csaf_uploader')
docker rmi $(docker images 'csaf_downloader')
docker rmi $(docker images 'csaf_aggregator')
docker rmi $(docker images 'csaf_checker')

docker image prune