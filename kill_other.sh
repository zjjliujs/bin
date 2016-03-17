#!/bin/bash
if [ "$1" == '-h' ]
then
  echo "usage: kill_other"
  echo "Kill all bash process expect the bash who run this script."
  exit 1
fi

ttys=$(who|awk '{print $2}')
echo $ttys
echo =====================

ttyMe=$(who am i|awk '{print $2}')
echo $ttyMe
echo =====================

declare -a ttyOthers
for i in $ttys
do
    echo ${#ttyOthers[@]}
    if [ "$i" != "$ttyMe" ]
    then 
        ttyOthers[${#ttyOthers[@]}]=$i
    fi
done
echo ${ttyOthers[@]}
echo =====================
#exit

for tty in ${ttyOthers[@]}
do
  ps aux|grep "@${tty}$"|grep -v grep|awk '{print $2}'|xargs kill
done
