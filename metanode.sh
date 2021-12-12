#!/bin/bash
set -E
source <(curl -s https://raw.githubusercontent.com/rangapv/bash-source/main/s1.sh) >/dev/null 2>&1

create() {
str231=`./ec2-metadata -z | awk '{split($0,a," "); print a[2]}'`
file1="/etc/kubernetes/aws.conf"
sudo tee << EOF /etc/kubernetes/aws.conf >/dev/null
[Global]
Zone = ${str231}
EOF
}


secrets () {

ac1="echo $AWS_ACCESS_KEY_ID"
ac2="echo $AWS_SECRET_ACCESS_KEY"

sec1=`kubectl create secret generic aws-access-1 --from-literal=AWS_ACCESS_KEY_ID=${ac1} -n kube-system`
sec2=`kubectl create secret generic aws-access-2 --from-literal=AWS_SECRET_ACCESS_KEY=${ac2} -n kube-system`
sec3=`kubectl create secret generic aws-secret --from-file=cloud.conf=/etc/kubernetes/cloud.conf --from-file=config=$HOME/.kube/config -n kube-system`

}


if [ -z "$mac" ]
then

if [ ! -z "$u1" ]
then
   if [ $ki = "ubuntu" ]
   then
     create
   fi
fi #end of u1 check

fi #end of mac check

