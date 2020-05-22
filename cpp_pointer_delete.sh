#!/bin/bash

if [ ! $# -eq 1 ]
then
        echo "Usage: $0 <file_name>"
        exit 0
fi

targetFile=$1

sed -n "s/\(^ \\)* .* \(.*\);/if (\2) \ndelete \2;/p" ${targetFile}
