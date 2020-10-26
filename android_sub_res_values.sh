#!/bin/bash

target_str="$1"
shift

while [ $# -gt 0 ]
do
    f="$1"
    dir=$( dirname "$f" )
    lang="$( echo "${dir}" | awk -F- '{print $2}' )"
    echo "$target_str --> ${lang}"
    sed -i "s/\<${target_str}\>/${lang}/" "$f"
    shift
done
