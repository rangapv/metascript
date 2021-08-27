#!/usr/bin/bash
set -E
#Install the runtime in this case it is the dockerd
source <(curl -s https://raw.githubusercontent.com/rangapv/doker/master/dock.sh)
#Call the init.d command
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8sinit-adm-calico-agnostic.sh)
#Call the calico ipip BGP config install CNI  and dashboard install
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8scalico-ipipBGP.sh)
