#!/usr/bin/bash

PROVIDER_NAME=csaf-test-provider

if [ -z "$1" ]
then
    FOLDER=$(pwd)
else
	FOLDER=$1
fi

FOLDER_GPG="$FOLDER/gpg"
mkdir -p "$FOLDER_GPG"

gpg --homedir "$FOLDER_GPG" --batch --passphrase '' --quick-gen-key $PROVIDER_NAME default default
gpg --homedir "$FOLDER_GPG" --output "$FOLDER_GPG/public.asc" --armor --export $PROVIDER_NAME
gpg --homedir "$FOLDER_GPG" --output "$FOLDER_GPG/private.asc" --armor --export-secret-key $PROVIDER_NAME

