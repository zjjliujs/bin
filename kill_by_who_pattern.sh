#!/bin/bash
if [ $# -ne 1 ]
then
  echo "usage: kill_by_ip <who-out-pattern>"
  exit 1
fi

pattern=$1

ttys=$(who|grep -e "${pattern}"|awk '{print $2}')

#echo $ttys
#exit 1

for tty in ${ttys}
do
  ps aux|grep "@${tty}$"|grep -v grep|awk '{print $2}'|xargs kill
done
