#!/bin/bash
if [ $# -ne 2 ]
then 
    echo "Usage: <command> <image name> <image tag>"
    exit -1
fi

imgName=$1
imgTag=$2

echo run docker image ${imgName}:${imgTag}

docker run --gpus all \
    --env NVIDIA_DRIVER_CAPABILITIES="utility,compute" \
    -v /home/liujinsong/quantize_ljs/data:/mnt/data \
    -v /home/liujinsong/quantize_ljs/model:/mnt/model \
    -v /home/liujinsong/cuda:/mnt/cuda \
    -v /home/liujinsong/caffes/caffe-quant-git:/mnt/caffe-quant \
    -v /home/liujinsong/caffes/caffe-cpu:/mnt/caffe-cpu \
    -v /home/liujinsong/download:/mnt/download \
    -w /root \
    -it ${imgName}:${imgTag}

