#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: rockrobo_release_note <mode> <version>"
	exit 11
fi

version="$2"
model="$1"

destdir="/cygdrive/c/work/apk/rr-${model}"
filename="${destdir}/release-note-${model}-${version}"

vi ${filename}

