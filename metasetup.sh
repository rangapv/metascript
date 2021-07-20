#!/bin/bash
#Run this script like: ./metasetup.sh access_id secret_id
set -E
source <(curl -s https://raw.githubusercontent.com/rangapv/bash-source/main/s1.sh) >/dev/null 2>&1

cont() {
acid="$1"
secid="$2"
export AWS_ACCESS_KEY_ID=${acid}
export AWS_SECRET_ACCESS_KEY=${secid}
sudo $cm1 -y install awscli >/dev/null 2>&1
sudo $cm1 -y install jq >/dev/null 2>&1
}


hid() {
wget http://s3.amazonaws.com/ec2metadata/ec2-metadata 
chmod u+x ec2-metadata
str23=`./ec2-metadata -i`
str233=`./ec2-metadata -z | awk '{split($0,a," "); print a[2]}' | sed 's/.$//'`
str231=`./ec2-metadata -z | awk '{split($0,a," "); print a[2]}'`
str232=`echo $str23 | awk '{split($0,a," "); print a[2]}'`
#echo "region $str231"
#echo "id $str232"

}

hpdns() {
pdns=`aws ec2 describe-instances --region=${str233} --instance-ids ${str232} | jq -r '.Reservations[].Instances[].PrivateDnsName'`
#echo "pdns $pdns"
}


hcfg() {
file1="/etc/cloud/cloud.cfg"
str2="preserve_hostname: true"
str1="preserve_hostname:"
sudo sed -i "s|${str1}.*|${str2}|" $file1
}


hcf() {

file2="/etc/hosts"
str3="127.0.0.1 localhost"
str4="127.0.0.1 localhost ${pdns}"
sudo sed -i "s|${str3}.*|${str4}|" $file2
sudo hostnamectl set-hostname ${pdns}
}

tag() {

stra21=`./ec2-metadata -a | awk '{split($0,a," "); print a[2]}'`
tag1=`aws ec2 create-tags --resources ${str232} --region ${str233} --tags Key=kubernetes.io/cluster/kubernetes,Value=owned`

}



cont $1 $2
hid
hpdns

if [ -z "$mac" ]
then

if [ ! -z "$u1" ]
then
   if [ $ki = "ubuntu" ]
   then
     hcfg
     hcf
     tag
   fi
fi #end of u1 check

fi #end of mac check
