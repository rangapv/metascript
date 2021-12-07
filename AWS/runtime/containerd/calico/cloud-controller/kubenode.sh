#!/usr/bin/bash
set -E
#Leaf Install on the Nodes to run ./metasetup.sh $access_id $secret_id
#Prudent to transfer the kube-config file to the Node before invoking this script
#Prepare the node in aws so that k8s can get hostanme as private DNS name
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/metasetup.sh $1 $2)
#Install the runtime in this case it is the containerd
source <(curl -s https://raw.githubusercontent.com/rangapv/runtimes/main/runcontainerD.sh)
#Install the k8s components and customize the runtime to use systemd
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_node/k8snodeinstall.sh)
#Install the cloud.conf for cloud-controller loops,call this after transfering config file from master hence commented
#This will install the /etc/kubernetes/cloud.conf file with Zone info
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/metanode.sh)
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/nodeconfig.sh)
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_node/k8scaliconode.sh)
#For Cloud-Controller-Manager modify the kubelet...on the nodes...
#Execute kubectl join by copying the line from Master node got during init.... then..install Calico below
#Install the flannel yaml
#source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_node/k8snodecalico.sh) 
