#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: tanos_v_cp.sh <mode> <version>"
	exit 11
fi

version="$2"
model="$1"

filename="rockrobo_vacuum-${version}-0.1.${version}-release.apk"

srcdir="plugProject/rockrobo_vacuum/build/outputs/apk/release"
destdir="/cygdrive/c/work/apk/tanos-v-${model}"

echo cp "${srcdir}/${filename}" "${destdir}/"
cp "${srcdir}/${filename}" "${destdir}/"
echo "Done!"

