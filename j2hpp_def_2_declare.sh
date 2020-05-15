#!/bin/bash

echo "注意：该程序要求函数定义开始(int, float...)必须在行顶头，函数定义的结束符(})也必须在行顶头"

if [ ! $# -eq 1 ]
then
        echo "Usage: $0 <file_name>"
        exit 0
fi

targetFile=$1

for k in float int "QPainter *" "QImage *" "unsigned int" char "unsigned char" bool void double
do
    echo "process $k ..."
    sed -i "/\(^${k} .\+(.*)\)[ \t]*{/{s/\(^${k} .\+(.*)\)[ \t]*{/\1;/; p; :x; N; s/\n}//; Tx; d}" ${targetFile}
done

echo Done！
