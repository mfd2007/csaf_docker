#!/usr/bin/bash

FOLDER="acme/files/"
FILES+=( "acme-1.json" "acme-2.json")

echo "++++++++ init provider ++++++++"
./upload.sh $FOLDER "--config=/data/config-create.ini"

echo "++++++++ upload files to provider ++++++++"
for f in ${FILES[@]}; do
  ./upload.sh $FOLDER "--config=/data/config-upload.ini /data/init/$f"
done
