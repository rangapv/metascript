#!/usr/bin/bash
set -E
#Install the runtime in this case it is the containerd
source <(curl -s https://raw.githubusercontent.com/rangapv/runtimes/main/runcontainerD.sh)
#Install the k8s components and customize the runtime to use systemd
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/adm_containerd_install.sh)
#Call the init.d command
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8sinit.sh)
