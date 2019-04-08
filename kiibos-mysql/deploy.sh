#!/usr/bin/env bash


echo "paascloud-provider-mysql starting..."
docker stack deploy -c ./docker-compose.yml ${ENV_NAME} --resolve-image changed --with-registry-auth
sleep 1s

echo "finished!"
