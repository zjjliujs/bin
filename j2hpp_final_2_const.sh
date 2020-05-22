#!/bin/bash

if [ ! $# -eq 1 ]
then
        echo "Usage: $0 <file_name>"
        exit 0
fi

targetFile=$1

ks=(private protected public)

for k in ${ks[@]}
do
    sed -i "s/${k} static final /static const /" ${targetFile}
done

sed -i "s/\(static const .* \)= .*;/\1;/" ${targetFile}

echo Done！
