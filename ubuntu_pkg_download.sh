#!/bin/bash
if [ $# -lt 1 ]
then
	echo "Usage: <command> <pkg_name> ..."
	exit
fi

pkgStore="/var/cache/apt/archives"

function doDownload() {
	pkg=$1	
	echo apt install "${pkg}" --reinstall -d
	sudo apt install "${pkg}" --reinstall -d 
	#cp -v "${pkgStore}/${pkg}*.deb" .
}

for pkg in $@
do
	doDownload ${pkg}
done
