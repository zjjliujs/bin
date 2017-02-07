#!/bin/bash

#读入git pull产生的小米sdk的log文件,将更新的文件复制到目标文件夹中

function cp_path {
	file=$1
	root_dir=$2

	file_base=$(basename "$file")
	file_path=$(dirname "$file")

	target_path="${root_dir}/${file_path}"

	if [ ! -d "${target_path}" ]
	then
		if [ -e "${target_path}" ]
		then
			rm -f ${target_path}
		fi
		mkdir -p "${target_path}"
	fi

	cp -vf "$file" "${target_path}"
}

if [ $# -ne 2 ]
then
	echo "Usage:xm_sdk_update <git-pull-log-file> <target-dir>"
	exit 1
fi

log_file=$1
target_dir=$2

#参数检查
if [ ! -e "${log_file}" ]
then
	echo "${log_file} not found!"
	exit 2
fi

if [ ! -f "${log_file}" ]
then
	echo "${log_file} is not a file!"
	exit 3
fi

if [ ! -e "${target_dir}" ]
then
	echo "${target_dir} not found!"
	exit 4
fi

if [ ! -d "${target_dir}" ]
then
	echo "${target_dir} is not a directory!"
	exit 5
fi


cat "${log_file}"| grep '|'|awk '{print $1}' | while read line
do
	if [ -f "${line}" ]
	then
		cp_path "${line}" "${target_dir}"
	else
		echo "${line} not found!"
	fi
done 
