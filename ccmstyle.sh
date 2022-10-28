#!/bin/bash
fileapi="/etc/kubernetes/manifests/kube-apiserver.yaml"
filecon="/etc/kubernetes/manifests/kube-controller-manager.yaml"
filekube="/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
#linebf="\-\-allow\-privileged\=true"
linebf="\-\-client\-ca\-file\=\/etc\/kubernetes\/pki\/ca\.crt"
linebb="bootstrap\-kubelet\.conf"
lineadd="\ \ \ \ \-\ \-\-cloud\-provider\=external"
linekad="\ \-\-cloud\-provider\=external"


cldchk () {
filee=$1
apichk=`sudo cat "$filee" | grep "\-\-cloud\-provider\=external"`
apichks="$?"
if [[ (( $apichks -ne 0 )) ]]
then
	sudo sed -i "/$linebf/a$lineadd" $filee
fi

}

kubchk () {
filee=$1
apichk=`sudo cat "$filee" | grep "\-\-cloud\-provider\=external"`
apichks="$?"
if [[ (( $apichks -ne 0 )) ]]
then
	sudo sed -i "s/$linebb/& $linekad/" $filee
fi

}

cldchk $fileapi
cldchk $filecon
kubchk $filekube
