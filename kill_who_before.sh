#!/bin/bash
if [ "$1" == '-h' ]
then
  echo "usage: kill_who_before"
  echo "Kill all bash process expect the last login one"
  exit 1
fi

lineCnt=$(who|wc -l)
lineCnt=$(($lineCnt - 1 ))

ttys=$(who|sort -k4.1,4.3 -s |sort -k4.4,5 -s |tail -$lineCnt|awk '{print $2}')
#echo $ttys
#exit 1

for tty in ${ttys}
do
  ps aux|grep "@${tty}$"|grep -v grep|awk '{print $2}'|xargs kill
done
