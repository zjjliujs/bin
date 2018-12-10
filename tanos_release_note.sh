#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: tanos_release_note <mode> <version>"
	exit 11
fi

version="$2"
model="$1"

destdir="/cygdrive/c/work/apk/tanos-${model}"
filename="${destdir}/release-note-${model}-${version}"

vi ${filename}

