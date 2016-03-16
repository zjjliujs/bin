#!/bin/bash
if [ $# -ne 1 ]
then
    echo "Usage: less2css.sh <base name of less>"
    echo "Will run lessc <base-name>.less > <base-name>.css"
    echo "Just for not overwrite less file by mistake action"
    exit 1
fi

baseName=$( basename $1 .less )

if [ ! -e ${baseName}.less ]
then
    echo "Couldn't find ${baseName}.less"
    exit 2
fi

cmd="lessc ${baseName}.less > ${baseName}.css"
echo $cmd

bash -c "$cmd"
