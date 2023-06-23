#!/bin/sh

if [ ! -d "/data/html" ]; then
  mkdir -p /data/html
fi

if [ ! -d "/data/archive" ]; then
  mkdir -p /data/archive
fi

if [ ! -d "/data/log" ]; then
  mkdir -p /data/log
fi

chown user:user -R /data/

if [ ! -f "/config/private.asc" ]; then
	PROVIDER_NAME=$(cat /config/config.toml | grep  'name\s*=' | head -1 | sed -E 's/name.*=.*"(.*)"/\1/')
	echo $PROVIDER_NAME
	FOLDER_GPG="/config/gpg"
	mkdir -p $FOLDER_GPG
	
	gpg --homedir "$FOLDER_GPG" --batch --passphrase '' --quick-gen-key "$PROVIDER_NAME" default default
	gpg --homedir "$FOLDER_GPG" --output "/config/public.asc" --armor --export $PROVIDER_NAME
	gpg --homedir "$FOLDER_GPG" --output "/config/private.asc" --armor --export-secret-key $PROVIDER_NAME
fi


if [ $INTERIM == "1" ]
then 
	/usr/local/csaf_aggregator --config=/config/config.toml --interim >> /data/log/interim.log
else
	/usr/local/csaf_aggregator --config=/config/config.toml >> /data/log/aggregate.log
fi

sleep $DELAY