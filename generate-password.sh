#!/bin/bash

CONTAINER_PORTAINER_PASSWORD_NAME=$(docker ps -a |grep portainer-password)

if [ "$CONTAINER_PORTAINER_PASSWORD_NAME" = "" ]; then
   echo "Creating Portainer Password Cotainer"
   docker create -v ~/portainer-compose/nginx/config/:/etc/nginx/conf.d/ --name portainer-password -i tobi312/rpi-apache2:latest htpasswd -cB /etc/nginx/conf.d/auth.htpasswd admin
fi

echo "Generating password..."
docker start -i portainer-password
