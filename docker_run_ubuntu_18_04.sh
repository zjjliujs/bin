#!/bin/bash
image="registry.cn-beijing.aliyuncs.com/zjjliujs1/ubuntu-18.04"
tag=":python36m"

if [ $# -gt 0 ]
then
	image=$1
fi

if [ $# -gt 1 ]
then
	tag=":$2"
fi

echo "Run docker with image: ${image}${tag}"

docker run -i -t \
	-v ~/docker/ubuntu-18.04:/mnt/download \
	-v ~/caffe/caffe-cpu:/mnt/caffe-cpu \
	${image}${tag}

