#!/usr/bin/bash
set -E
#Create the /etc/kubernetes/cloud.conf
#Create the secrets file to be referenced by the cloud controllerd contaienr in this ccm-aws.yaml file
#sc1=`kubectl create secret generic aws-secret --from-file=cloud.conf=/etc/kubernetes/cloud.conf --from-file=config=$HOME/.kube/config --from-file=AWS_ACCESS_KEY_ID=$HOME/access_id --from-file=AWS_SECRET_ACCESS_KEY=$HOME/secret_id -n kube-system`

#Install the CCM RBAC 
sc2=`kubectl apply -f  https://raw.githubusercontent.com/rangapv/k8s/master/ccm/ccm-rbac.yaml`
echo "ccm RBAC output is $sc2"
#Install the CCM for AWS Cloud Control Loops 
sc3=`kubectl apply -f  https://raw.githubusercontent.com/rangapv/k8s/master/ccm/ccm-aws.yaml`
echo "ccm-aws  output is $sc3"
