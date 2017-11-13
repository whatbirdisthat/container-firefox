#!/bin/bash

firefox() {
  ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
  xhost + $ip
  docker run --rm -d --name firefox \
    --net host \
    -e DISPLAY=$ip:0 \
    -e XAUTHORITY=/tmp/xauth \
    -v ${HOME}/.Xauthority:/tmp/xauth \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v #CONTAINER_FIREFOX_LOCATION#/.mozilla:/root/.mozilla \
    jess/firefox
}
