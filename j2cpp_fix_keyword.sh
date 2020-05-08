#!/bin/bash

if [ ! $# -eq 1 ]
then
        echo "Usage: $0 <file_name>"
        exit 0
fi

targetFile=$1

sed -i "s/boolean /bool /g" ${targetFile}

echo Done！
