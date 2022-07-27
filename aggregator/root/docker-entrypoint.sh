#!/bin/sh

if [ $INTERIM == "1" ]
then 
	/usr/local/csaf_aggregator --config=/config/csaf/aggregator.toml --interim >> /data/log/interim.log
else
	/usr/local/csaf_aggregator --config=/config/csaf/aggregator.toml >> /data/log/aggregate.log
fi

sleep $DELAY