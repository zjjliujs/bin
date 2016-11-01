#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: cp_rockrobo <mode> <version>"
	exit 11
fi

version="$2"
model="$1"

filename="rockrobo_vacuum-${version}-0.1.${version}-release.apk"

srcdir="plugProject/rockrobo_vacuum/build/outputs/apk"
destdir="/cygdrive/c/work/apk/rr-${model}"

cp "${srcdir}/${filename}" "${destdir}/"
