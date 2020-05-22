#!/bin/bash

if [ ! $# -eq 1 ]
then
        echo "Usage: $0 <file_name>"
        exit 0
fi

targetFile=$1

sed -i 's/^\(^[ \t]*\)\([a-zA-Z]\+\) \* \([a-zA-Z]\+\);$/\1\2 * \3 = nullptr;/' ${targetFile}

echo Done！
