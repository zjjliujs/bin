#!/bin/bash

echo "注意：该程序要求函数定义开始(int, float...)必须在行顶头，函数定义的结束符(})也必须在行顶头"

if [ ! $# -eq 1 ]
then
        echo "Usage: $0 <file_name>"
        exit 0
fi

targetFile=$1

ks=(float int QPainter QImage unsigned char bool void double)
ks=(${ks[@]} MapShape GLLocateRect MapPathInfoI GLPathFillRect)
ks=(${ks[@]} GLSpeedBump GLForbiddenZone MapObject MapConfigI)
ks=(${ks[@]} UpwardRect)
ks=(${ks[@]} MapInfoI)
ks=(${ks[@]} PointObject)
ks=(${ks[@]} RobotHaloObject)
ks=(${ks[@]} RectTextureObject)
ks=(${ks[@]} MapLoadingAnim)
ks=(${ks[@]} ScaleRulerObject)
ks=(${ks[@]} ShapeInfoObject)
ks=(${ks[@]} MapResMgrI)

for k in ${ks[@]}
do
    echo "process $k ..."
    sed -i "/\(^${k} .\+(.*)\)[ \t]*{/{s/\(^${k} .\+(.*)\)[ \t]*{/\1;/; p; :x; N; s/\n}//; Tx; d}" ${targetFile}
done

echo Done！
