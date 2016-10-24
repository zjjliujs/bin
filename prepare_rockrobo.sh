#!/bin/bash
if [ $# -lt 2 ] 
then
	echo "prepare_rockrobo.sh <v1|v2|v3> <versionCode>"
	exit 1
fi

model="$1"
version="$2"

case ${model} in 
	"v1")
		modelName="rockrobo.vacuum.v1";;
	"v2")
		modelName="rockrobo.sweeper.v2";;
	"v3")
		modelName="rockrobo.sweeper.v1";;
	*) 
		echo "错误的model -- ${model}";
		exit 5;;
esac

echo ${modelName}


echo "prepare for ${model} and ${version}"

#处理./plugProject/rockrobo_vacuum/src/main/java/com/rockrobo/xmplugin/Device.java
p=./plugProject/rockrobo_vacuum/src/main/java/com/rockrobo/xmplugin/Device.java
if [ ! -f "$p" ]
then
	echo "找不到文件./plugProject/rockrobo_vacuum/src/main/java/com/rockrobo/xmplugin/Device.java"
	exit 2
fi

#检查文件的合理性
c=$(sed -n '/^[ \t]\+public[ \t]\+static[ \t]\+final[ \t]\+String[ \t]\+MODEL[ \t]*=[ \t]*/p' "$p"|wc -l)
if [ $c -ne 1 ]
then
	echo "Device.java中似乎没有定义MODEL,请手动检查"
	exit 3
fi

c=$(sed -n '/^\/\/[ \t]\+public[ \t]\+static[ \t]\+final[ \t]\+String[ \t]\+MODEL[ \t]*=[ \t]*/p' "$p"|wc -l)
if [ $c -ne 2 ]
then
	echo "Device.java中注释掉的MODEL定义应该有两行，但是实际找到$c行，请检查！"
	exit 4
fi

#注释掉所有MODEL定义
sed -i 's/^[ \t]\+public[ \t]\+static[ \t]\+final[ \t]\+String[ \t]\+MODEL[ \t]*=[ \t]*/\/\/&/' "$p"

#打开对应model的MODEL定义
sed -i "s/^\/\/\([ \t]\+public[ \t]\+static[ \t]\+final[ \t]\+String[ \t]\+MODEL[ \t]*=[ \t]*\"${modelName}\"\)/\1/" "$p"

