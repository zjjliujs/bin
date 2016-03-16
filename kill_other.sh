#!/bin/bash
if [ "$1" == '-h' ]
then
  echo "usage: kill_other"
  echo "Kill all bash process expect the bash who run this script."
  exit 1
fi

ttys=$(who|awk '{print $2}')
#echo $ttys

ttyMe=$(who am i|awk '{print $2}')

declare -a ttyOthers
for i in $ttys
do
    if [ "$i" != "$ttyMe" ]
    then 
        ttyOthers[${#ttyOthers}]=$i
    fi
done
#echo ${ttyOthers[@]}
#exit

for tty in ${ttyOthers[@]}
do
  ps aux|grep "@${tty}$"|grep -v grep|awk '{print $2}'|xargs kill
done
