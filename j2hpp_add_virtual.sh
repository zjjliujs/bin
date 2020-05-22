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
ks=("${ks[@]}" GLLocateRect)
ks=("${ks[@]}" MapPathInfoI)
ks=("${ks[@]}" MapResMgrI)
ks=("${ks[@]}" MapDataInfoI)
ks=("${ks[@]}" MapType)

for k in "${ks[@]}"
do
    echo "Add virtural for ${k} function..."
    sed -i "s/\(^[ \t]*\)\(${k}\) /\1virtual \2 /g" ${targetFile}
done

echo Done！
