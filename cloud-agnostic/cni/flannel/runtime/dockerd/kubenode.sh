#!/usr/bin/bash
set -E
#Install the runtime in this case it is the dockerd
source <(curl -s https://raw.githubusercontent.com/rangapv/doker/master/dock.sh)
#Install the k8s components and customize the runtime to use systemd
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_node/k8snodeinstall.sh)
#Execute the following line after copying the config file from the master via ftp
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/nodeconfig.sh)
#Execute kubectl join by copying the line from Master node got during init(It is in the flag.txt).... then..install flannel below
#Install the flannel yaml
#source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8sfladash.sh)
#      or
# kubectl apply -f https://raw.githubusercontent.com/rangapv/k8s/master/kube_flannel/kube-flannel.yml
