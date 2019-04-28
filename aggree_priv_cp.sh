#/bin/bash

#usage
#find . -name "*隐私*.html"|xargs aggree_priv_cp.sh ../aggreement_privacy_res/raw privacy
#find . -name "*用户协议*.html"|xargs aggree_priv_cp.sh ../aggreement_privacy_res/raw aggreement

outBaseD="$1"
shift
outBaseF="$1"
shift

while [ $# -gt 0 ]
do
	inf=$1
	part1=$( echo "${inf}" |awk -F/ '{print $2}' )
	#echo $part1
	part2=$( echo "${inf}" |awk -F/ '{print $3}' )
	#echo $part2

	outFname="${outBaseF}_${part1}.html"
	outDir="${outBaseD}-${part2}"
	outPath="${outDir}/${outFname}"
	#echo ${outPath}

	if [ ! -d "${outDir}" ]
	then
		echo "${outDir} not exist! create ..."
		mkdir -p "${outDir}"
	fi
	
	cp -v "${inf}" "${outPath}"
	shift
done
