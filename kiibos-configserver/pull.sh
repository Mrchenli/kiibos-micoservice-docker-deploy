#!/usr/bin/env bash

function pull_one(){
    docker pull $1
    ssh -tt root@${NODE_TWO} "docker pull $1"
    ssh -tt root@${NODE_THREE} "docker pull $1"
}

##pull image ==>
pull_one ${CONFIGSRV_IMAGE_NAME}
##<== pull image