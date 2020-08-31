#!/bin/bash
docker run --gpus all \
    --env NVIDIA_DRIVER_CAPABILITIES="utility,compute" \
    -v /home/liujinsong/quantize_ljs/data:/mnt/data \
    -v /home/liujinsong/quantize_ljs/model:/mnt/model \
    -w /root \
    -it ubuntu-18.04-tsm:cuda
