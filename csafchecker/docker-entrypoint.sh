#!/bin/sh

export PATH=$PATH:/usr/local/go/bin
sleep 1
/usr/local/csaf_checker --insecure --verbose -o /log/$LOG_FILE $CSAF_DOMAIN
/usr/local/csaf_checker --insecure --verbose --format=html -o /log/$LOG_FILE.html $CSAF_DOMAIN

