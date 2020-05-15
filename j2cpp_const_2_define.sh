#!/bin/bash

function const2Define() {
    t=$1

    echo "Const to define!"
    for a in private protected public
    do
        sed -i "s/${a}[ \t]\+static[ \t]\+final[ \t]\+${t}[ \t]\+\(.*\)[ \t]\+=[ \t]\+\(.*\);/#define \1 \2/" ${targetFile}
    done

    echo Done！
}

if [ ! $# -eq 1 ]
then
   echo "Usage: $0 <file_name>"
   echo 'Convert such as "MapShape mapShape" to "MapShape * mapShape"'
   exit 0
fi

targetFile=$1

const2Define int
const2Define float
const2Define byte
