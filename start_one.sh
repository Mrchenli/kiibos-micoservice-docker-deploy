#!/usr/bin/env bash

export ENV_NAME=kiibos-micoservice
export NODE_ONE=192.168.100.8
export IP_RANGE=10.0.12.0/24

##nginx==>
export GATEWAY_PORT=7080 #gateway 入口
export DEVICE_GATE_PORT=7090 #设备gateway
export WEBSOCKET_PORT=8090
export WEB_UI_PORT=58080
##<==nginx



##image-version==>
export IMG_VERSION=1.0.0
export ZK_IMAGE_NAME=zookeeper
export REDIS_IMAGE_NAME=bitnami/redis:latest
export NGINX_IMAGE_NAME=nginx:1.15.5
export MYSQL_IMAGE_NAME=mysql:5.7
export KAFKA_IMAGE_NAME=registry.cn-hangzhou.aliyuncs.com/iotbull/iotbull-kafka:1.0.0
export KAFKA_EAGLE_IMAGE_NAME=registry.cn-hangzhou.aliyuncs.com/iotbull/kafka-offset-monitor:1.0.0
export GATEWAY_IMAGE_NAME=registry.cn-hongkong.aliyuncs.com/kiibos/kiibos-configserver:${IMG_VERSION}
export EUREKA_IMAGE_NAME=registry.cn-hongkong.aliyuncs.com/kiibos/kiibos-eureka:${IMG_VERSION}
export CONFIGSRV_IMAGE_NAME=registry.cn-hongkong.aliyuncs.com/kiibos/kiibos-configserver:${IMG_VERSION}
export UAC_IMAGE_NAME=registry.cn-hongkong.aliyuncs.com/kiibos/kiibos-configserver:${IMG_VERSION}

##<==image-version

echo "1.creating network..."

a=$(docker network ls | grep '${ENV_NAME}')

if [[ -n "$a" ]]; then
	echo "${ENV_NAME} exists"
else
	docker network create --driver overlay --subnet ${IP_RANGE} ${ENV_NAME}
	echo "${ENV_NAME} created"
fi
echo "2.finish network"
sleep 1s

sh $PWD/deploy.sh