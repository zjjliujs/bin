#!/bin/bash
if [ $# -lt 2 ]
then
	echo "Usage adjust_share_res_string.sh <from-dir> <to-dir>"
	exit 1
fi

#fromdir="/home/liujinsong/rubys-4.0/plugProject/rockrobo_vacuum/src/main/res"
fromdir=${1}
#targetdir="/home/liujinsong/tanos/plugProject/rockrobo_vacuum/src/main/res"
#targetdir="res"
targetdir=${2}

suffixs='de es fr it ja-rJP ko-rKR ru zh zh-rHK zh-rTW'

for s in ${suffixs}
do
	fromfile="${fromdir}/values-${s}/strings.xml"
	todir="${targetdir}/values-${s}"	
	tofile="${todir}/map_share.xml"
	#echo ${tofile}

	if [ -d ${todir} ]
	then
		echo '<?xml version="1.0" encoding="utf-8"?>' > ${tofile}
		echo '<resources>' >> ${tofile}

		sed -n "/share_\(sub\)*title/p" ${fromfile} >> ${tofile}

		echo '</resources>' >> ${tofile}
	else
		echo "${todir} not exist!"
	fi
done
