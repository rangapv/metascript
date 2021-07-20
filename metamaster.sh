#!/bin/bash
set -E
source <(curl -s https://raw.githubusercontent.com/rangapv/bash-source/main/s1.sh) >/dev/null 2>&1

secrets () {

ac1="echo $AWS_ACCESS_KEY_ID"
ac2="echo $AWS_SECRET_ACCESS_KEY"

sec1=`kubectl create secret generic aws-access-1 --from-literal=AWS_ACCESS_KEY_ID=${acid} -n kube-system`
sec2=`kubectl create secret generic aws-access-2 --from-literal=AWS_SECRET_ACCESS_KEY=${secid} -n kube-system`
sec3=`kubectl create secret generic aws-secret --from-file=cloud.conf=/etc/kubernetes/cloud.conf --from-file=config=$HOME/.kube/config -n kube-system`

}


if [ -z "$mac" ]
then

if [ ! -z "$u1" ]
then
   if [ $ki = "ubuntu" ]
   then
     secrets
   fi
fi #end of u1 check

fi #end of mac check
