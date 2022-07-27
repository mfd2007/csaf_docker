#!/bin/sh

if [ -f "/data/config.ini" ]; then
	/usr/local/csaf_uploader --config=/data/config.ini
else
	/usr/local/csaf_uploader $@ 
fi
