#/bin/bash

outFile="$1"

while [ $# -gt 1 ]
do
	inf=$2
	odir=$( dirname "${inf}" )
	cp -v "${inf}" "${odir}/${outFile}"
	shift
done
