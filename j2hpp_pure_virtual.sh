#!/bin/bash

if [ ! $# -eq 1 ]
then
        echo "Usage: $0 <file_name>"
        exit 0
fi

targetFile=$1

ks=(int float bool void char QImage QPainter UpwardRect MapObject "unsigned\ char" MapShape)
ks=("${ks[@]}" MapInfoI)
ks=("${ks[@]}" PointObject)
ks=("${ks[@]}" RobotHaloObject)
ks=("${ks[@]}" MapLoadingAnim)
ks=("${ks[@]}" MapConfigI)

for k in ${ks[@]}
do
    echo "Pure virtual function for $k function..."
    sed -i "s/\(^[ \t]*virtual ${k} .*)\);/\1 = 0; /" ${targetFile}
done

echo Done！
