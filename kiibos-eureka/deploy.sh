#!/usr/bin/env bash



echo "paascloud-provider-eureka starting..."
docker stack deploy -c ./docker-compose-eureka.yml ${ENV_NAME} --resolve-image changed --with-registry-auth
sleep 1s

echo "finished!"
