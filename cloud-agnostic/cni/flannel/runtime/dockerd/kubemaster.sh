#!/usr/bin/bash
set -E
#Install the runtime in this case it is the dockerd
source <(curl -s https://raw.githubusercontent.com/rangapv/doker/master/dock.sh)
#Call the init.d command
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8sinit-adm.sh)
#Call the flannel and dashboard install
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8sfladash.sh)
