#!/usr/bin/env bash

function pull_one(){
    docker pull $1
}

##pull image ==>
pull_one ${CONFIGSRV_IMAGE_NAME}
##<== pull image