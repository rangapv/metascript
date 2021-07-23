#!/usr/bin/bash
set -E
#Install the runtime in this case it is the containerd
source <(curl -s https://raw.githubusercontent.com/rangapv/runtimes/main/runcontainerD.sh)
#Install the k8s components and customize the runtime to use systemd
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_node/k8snodeinstall.sh)
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/nodeconfig.sh)
#Execute kubectl join by copying the line from Master node got during init.... then..install Calico below
#Install the Calcio yaml
#source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8scalicodash.sh)
# or
# kubectl apply -f https://raw.githubusercontent.com/rangapv/k8s/master/kube_calico/kube-calico.yaml
