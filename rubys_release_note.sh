#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: rubys_release_note <mode> <version>"
	exit 11
fi

version="$2"
model="$1"

destdir="/cygdrive/d/work/apk/rubys-${model}"
filename="${destdir}/release-note-${model}-${version}"

vi ${filename}

