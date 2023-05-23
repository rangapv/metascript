#!/bin/sh
set -E

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

met1=`which ec2-metadata`
met1s="$?"

if [[ (( $met1s -ne 0 )) ]]
then
    hid
else
	echo "ec2-metadata already installed"
fi

