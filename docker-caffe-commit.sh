#!/bin/bash
if [ $# -lt 1 ]
then
	echo "Usage: command <container_id> [<commit message>]"
	exit
fi

containerId=$1

if [ $# -lt 2 ]
then
	msg="Commit docker image"
else
	msg=$2
fi

echo docker commit -m \"${msg}\" "${containerId}"  ubuntu-18.04-caffe:base
docker commit -m "${msg}" "${containerId}"  ubuntu-18.04-caffe:base
