#!/bin/sh

mkdir /data-local/
cp -r /data/* /data-local/

if [ $INTERIM == "1" ]
then 
	/usr/local/csaf_aggregator --config=/config/csaf/aggregator.toml --interim >> /data/log/interim.log
else
	/usr/local/csaf_aggregator --config=/config/csaf/aggregator.toml >> /data/log/aggregate.log
fi

rm -rf /data/archive/
cp -r /data-local/* /data/
chown user:user -R /data/*
rm -rf /data-local/

sleep $DELAY