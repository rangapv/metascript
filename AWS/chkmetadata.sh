#!/bin/bash
#this script checks if metadata is already downloaded and installed
#weirdly this same loop if included in metadata-aws.sh is not working

set -E

#met1=`which ec2-metadata`
#met1s="$?"

#if [[ (( $met1s -ne 0 )) ]]
#then
     #source "./metadata-aws.sh"
     source <(curl -s https://raw.githubusercontent.com/rangapv/metascript/main/AWS/metadata-aws.sh)
#fi
