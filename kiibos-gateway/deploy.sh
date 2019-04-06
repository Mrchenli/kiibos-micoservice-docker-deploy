#!/usr/bin/env bash



echo "paascloud-provider-gateway starting..."
docker stack deploy -c ./docker-compose-gateway.yml ${ENV_NAME} --resolve-image changed --with-registry-auth
sleep 1s

echo "finished!"
