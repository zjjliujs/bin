#!/bin/bash
#用于合并米家SDK到石头世纪开发环境
plugin_dir="/cygdrive/d/AndroidStudioProjects/mijia_plugin"
#plugin_dir=~/tmp

if [ $# != 1 ]
then
	echo "Usage: mijia_merge <向前版本号>"
	echo "合并直到前面多少个版本的改动"
	exit 1
fi

#检查是否是在米家SDK的git工作目录中
git_url=$( git config remote.origin.url )
if [ "$git_url" != "https://github.com/MiEcosystem/NewXmPluginSDK" ]
then
	echo "请在米家SDK的工作目录中运行本程序"
	exit 2
fi

#得到改动文件列表
declare -a fa
fs=$( git diff --stat=500,200 HEAD..HEAD~${1} |awk '{print $1}' )
mapfile fa <<EOF
$fs
EOF

for f in "${fa[@]}"
do
	if [ -f $f ]
	then
		dest_path=$( dirname  "${plugin_dir}/$f" )
		if [ ! -d "${dest_path}" ]
		then
			mkdir -p "${dest_path}"
		fi
		echo
		echo rsync $f to ${dest_path}
		rsync $f "${dest_path}"
	else
		echo WARING!! $f not found!
	fi
done

#复制文档，git命令行无法正确得到汉字文件名
echo 
echo 现在复制.md, .pdf文档

fs=$( ls *.md *.pdf )
mapfile fa <<EOF
$fs
EOF

for f in "${fa[@]}"
do
	if [ -f $f ]
	then
		echo cp $f ${plugin_dir}
		cp -f $f ${plugin_dir}
	else
		echo WARING!! $f not found!!
	fi
done
