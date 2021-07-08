#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 
	exit 1
fi

SECRETS_PATH=./secrets/ssh_host_rsa_key 
SECRETS_DIR=`dirname "$SECRETS_PATH"`

echo "Creating secrets dir ($SECRETS_DIR) if it doesn't exist and chmod-ing it to 655"
mkdir -p "$SECRETS_DIR"
chmod 655 "$SECRETS_DIR"

if [ ! -f "$SECRETS_PATH" ]; then
	echo "$SECRETS_PATH doesn't exist, generating one"
	ssh-keygen -t rsa -f "$SECRETS_PATH" -N ""
fi

docker-compose up --build -d
docker-compose logs -f

