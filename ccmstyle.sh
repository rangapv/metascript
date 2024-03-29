#!/bin/bash
source <(curl -s https://raw.githubusercontent.com/rangapv/kubestatus/main/ks.sh) >>/dev/null 2>&1

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

inst () {
candi="$1"
wget http://s3.amazonaws.com/ec2metadata/ec2-metadata 
chmod u+x ec2-metadata
}

kubchk () {
filee=$1
apichk=`sudo cat "$filee" | grep "\-\-cloud\-provider\=external"`
apichks="$?"
if [[ (( $apichks -ne 0 )) ]]
then
	sudo sed -i "s/$linebb/& $linekad/" $filee
	sudo systemctl daemon-reload
	sudo systemctl restart kubelet
	echo "done kubelet"
fi

}

cloudconf () {
chkec2meta=`find ./ec2-metadata`
chkec2metas="$?"
if [[ (( $chkec2metas -ne 0 )) ]]
then
   inst ec2-metadata
fi   

str231=`./ec2-metadata -z | awk '{split($0,a," "); print a[2]}'`
fileconf="/etc/kubernetes/cloud.conf"
fconfline1="[Global]"
fconfline2="Zone=$str231"
if [[ ( ! -f "$fileconf" ) ]]
then

       sudo touch "$fileconf"
fi
if [[ ( ! -z "$fileconf" ) ]]
then
        sudo chmod 777 "$fileconf"
        #sudo sed -i "//a\$fconfline1" $fileconf
        #awk 'BEGIN { print $fconfline1, $fconfline2 > "/home/ubuntu/ftg/cloud.conf"}'
        sudo echo -en "$fconfline1\n$fconfline2" > "$fileconf"
fi
}

if [[ (( $master -eq 1 )) ]] 
then
cldchk $fileapi
cldchk $filecon
kubchk $filekube
elif [[ (( $node -eq 1 )) ]]
then
kubchk $filekube
else
	echo "Nothing to Do"
fi
cloudconf
