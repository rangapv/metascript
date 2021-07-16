#!/usr/bin/bash
set -E
#Prepare the node in aws so that k8s can get hostanme as private DNS name
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/metasetup.sh $1 $2)
#Install the runtime in this case it is the containerd
source <(curl -s https://raw.githubusercontent.com/rangapv/runtimes/main/runcontainerD.sh)
#Install the k8s components and customize the runtime to use systemd
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_node/k8snodeinstall.sh)
#Install the flannel yaml, call this after transfering config file from master hence commented
#source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8sfladash.sh)
#Install the cloud.conf for cloud-controller loops
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/metanode.sh)
