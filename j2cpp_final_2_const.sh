#!/bin/bash

if [ ! $# -eq 2 ]
then
        echo "Usage: $0 <file_name> <class_name>"
        exit 0
fi

targetFile=$1
className=$2

ks=(private protected public)

for k in ${ks[@]}
do
    sed -i "s/${k} static final /const /" ${targetFile}
done

ks=(long int)
for k in ${ks[@]}
do
    sed -i "s/\(const ${k}\) \(.* = .*\);/\1 ${className}::\2;/" ${targetFile}
done

echo Done！
