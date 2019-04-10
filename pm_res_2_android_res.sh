#!/bin/bash

dst="/cygdrive/c/cygwin64/home/liujinsong/tanos/plugProject/rockrobo_vacuum/src/main/res"
for i in *
do 
    f=$i
    tc=$( echo $f|awk '{print $2}' )
    c=$( echo $tc|awk -F. '{print $1}')
    cp -v "$f" "${dst}/values-${c}/strings.xml"
done
