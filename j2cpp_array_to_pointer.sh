#!/bin/bash

if [ ! $# -eq 1 ]
then
        echo "Usage: $0 <file_name>"
        exit 0
fi

targetFile=$1

for k in int float bool 
do
        sed -i "s/\(${k}\)\[\] /\1* /g" ${targetFile}
done

echo Done！
