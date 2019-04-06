#!/usr/bin/env bash

echo "pull images starting ... "
chmod a+x ./pull.sh
sh ./pull.sh
echo "pull images over ... "

docker service rm ${ENV_NAME}_kiibos-configserver
sleep 2s
echo "remove ${ENV_NAME}_kiibos-configserver"

echo "kiibos-configserver starting..."
docker stack deploy -c ./docker-compose-configserver.yml ${ENV_NAME} --resolve-image changed --with-registry-auth
sleep 1s

echo "finished!"
