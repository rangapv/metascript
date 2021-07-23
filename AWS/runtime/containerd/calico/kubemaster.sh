#!/usr/bin/bash
set -E
#Install the runtime in this case it is the containerd
source <(curl -s https://raw.githubusercontent.com/rangapv/runtimes/main/runcontainerD.sh)
#Call the init.d command
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8sinit-adm-calico-aws.sh)
#Call the flannel and dashboard install
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8scalicodash.sh)
