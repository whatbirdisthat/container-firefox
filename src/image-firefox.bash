#!/bin/bash

firefox() {
  ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
  docker run --rm -d --name firefox -e DISPLAY=$ip:0 -v /tmp/.X11-unix:/tmp/.X11-unix jess/firefox
}
