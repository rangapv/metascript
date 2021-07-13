#!/bin/bash
set -E
conf1=`mkdir -p $HOME/.kube`
conf2=`sudo cp -i $HOME/config $HOME/.kube/config`
conf3=`sudo chown $(id -u):$(id -g) $HOME/.kube/config`
