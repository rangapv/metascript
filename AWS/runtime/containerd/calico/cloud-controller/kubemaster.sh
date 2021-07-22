#!/usr/bin/bash
set -E
#Prepare the node in aws so that k8s can get hostanme as private DNS name
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/metasetup.sh $1 $2)
#Install the runtime in this case it is the containerd
source <(curl -s https://raw.githubusercontent.com/rangapv/runtimes/main/runcontainerD.sh)
#Call the init.d command
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8sinit.sh)
#Call the create cloud.conf and secrets file on the master node cluster
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/metamaster.sh)
#Call the flannel and dashboard install
source <(curl -s https://raw.githubusercontent.com/rangapv/k8s/master/kube_adm/k8scalicodash.sh)
#Call the Cloud Controller Manager for AWS by the following script if you Dont need this but only vanilla cluster comment-it-out
source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/kubeccm-aws.sh)
