#!/bin/bash
set -e 

srcHost=ljs-laptop-lan
srcDir=/home/ljs/download/apt-pkgs
dstDir=/home/EDZ/Downloads/apt-pkgs

if [ ! -d "${dstDir}" ]
then
    echo  "${dstDir} not found!"
fi

rsync -av "ljs@${srcHost}:${srcDir}" "${dstDir}"
