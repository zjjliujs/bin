#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: ruby_cp.sh <mode> <version>"
	exit 11
fi

version="$2"
model="$1"

filename="rockrobo_vacuum-${version}-0.1.${version}-release.apk"

srcdir="plugProject/rockrobo_vacuum/build/outputs/apk/release"
destdir="/cygdrive/c/work/apk/ruby-${model}"

echo cp "${srcdir}/${filename}" "${destdir}/"
cp "${srcdir}/${filename}" "${destdir}/"
echo "Done!"

