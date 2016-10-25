#!/bin/bash
if [ $# -lt 2 ] 
then
	echo "prepare_rockrobo.sh <v1|v2|v3> <versionCode>"
	exit 10
fi

model="$1"
version="$2"

modelNames[0]="rockrobo.vacuum.v1"
modelNames[1]="rockrobo.sweeper.v2"
modelNames[2]="rockrobo.sweeper.v1"

case ${model} in 
	"v1")
		modelName=${modelNames[0]}
		applicationId="com.rockrobo.app";;
	"v2")
		modelName=${modelNames[1]}
		applicationId="com.rockrobo_test.app";;
	"v3")
		modelName=${modelNames[2]}
		applicationId="com.rockrobo_innertest.app";;
	*) 
		echo "错误的model -- ${model}";
		exit 11;;
esac

#echo ${modelName}
#echo "prepare for ${model} and ${version}"

#处理./plugProject/rockrobo_vacuum/src/main/java/com/rockrobo/xmplugin/Device.java
p=./plugProject/rockrobo_vacuum/src/main/java/com/rockrobo/xmplugin/Device.java
echo "处理$p"

if [ ! -f "$p" ]
then
	echo "找不到文件$p"
	exit 20
fi

#检查文件的合法性
c=$(sed -n '/^[ \t]\+public[ \t]\+static[ \t]\+final[ \t]\+String[ \t]\+MODEL[ \t]*=[ \t]*/p' "$p"|wc -l)
if [ $c -ne 1 ]
then
	echo "Device.java中似乎没有定义MODEL,请手动检查"
	exit 21
fi

c=$(sed -n '/^\/\/[ \t]\+public[ \t]\+static[ \t]\+final[ \t]\+String[ \t]\+MODEL[ \t]*=[ \t]*/p' "$p"|wc -l)
if [ $c -ne 2 ]
then
	echo "Device.java中注释掉的MODEL定义应该有两行，但是实际找到$c行，请检查！"
	exit 22
fi

#注释掉所有MODEL定义
sed -i 's/^[ \t]\+public[ \t]\+static[ \t]\+final[ \t]\+String[ \t]\+MODEL[ \t]*=[ \t]*/\/\/&/' "$p"

#打开对应model的MODEL定义
sed -i "s/^\/\/\([ \t]\+public[ \t]\+static[ \t]\+final[ \t]\+String[ \t]\+MODEL[ \t]*=[ \t]*\"${modelName}\"\)/\1/" "$p"


#处理./plugProject/rockrobo_vacuum/build.gradle
p=./plugProject/rockrobo_vacuum/build.gradle
echo "处理$p"

if [ ! -f "$p" ]
then
	echo "找不到文件$p"
	exit 31
fi

#检查文件的合法性
c=$(sed -n '/^[ \t]*applicationId[ \t]\+\"com\.rockrobo.*\"/p' "$p"|wc -l)
if [ $c -ne 1 ]
then
	echo "$p 应该有一行applicationID \"com.rocorobo...\",但是没有找到或者找到不止一行！"
	exit 32
fi

c=$(sed -n '/^[ \t]*versionCode[ \t]\+[0-9]\+/p' "$p"|wc -l)
if [ $c -ne 1 ]
then
	echo "$p 应该有一行versionCode <数字>,但是没有找到或者找到不止一行！"
	exit 33
fi

c=$(sed -n '/^[ \t]*versionName[ \t]\+\"[^"]*\"/p' "$p"|wc -l)
if [ $c -ne 1 ]
then
	echo "$p 应该有一行versionName "<版本字符串>",但是没有找到或者找到不止一行！"
	exit 34
fi

#修改applicationId
#sed "s/\(^[ \t]*applicationId[ \t]\+\)\"com\.rockrobo.*\"/\1 \"${applicationId}\"/" "$p" |grep applicationId
sed -i "s/\(^[ \t]*applicationId[ \t]\+\)\"com\.rockrobo.*\"/\1\"${applicationId}\"/" "$p" 

#修改versionCode
#sed "s/\(^[ \t]*versionCode[ \t]\+\)[0-9]\+/\1${version}/" "$p"|grep versionCode
sed -i "s/\(^[ \t]*versionCode[ \t]\+\)[0-9]\+/\1${version}/" "$p"

#修改versionName
#sed "s/\(^[ \t]*versionName[ \t]\+\)\(\"[0-9]\+\.[0-9]\+\.\)[0-9]\+\"/\1\2${version}\"/" "$p"|grep versionName
sed -i "s/\(^[ \t]*versionName[ \t]\+\)\(\"[0-9]\+\.[0-9]\+\.\)[0-9]\+\"/\1\2${version}\"/" "$p"

#处理./plugProject/rockrobo_vacuum/src/main/AndroidManifest.xml
p=./plugProject/rockrobo_vacuum/src/main/AndroidManifest.xml
echo "处理$p"

if [ ! -f "$p" ]
then
	echo "找不到文件$p"
	exit 41
fi

c=$(sed -n "/^[ \t]*android:name[ \t]*=[ \t]*\"model\"/p" "$p"|wc -l)
if [ $c -ne 1 ]
then
	echo "没有找到android:name=\"model\"的行"
	exit 42
fi

for i in 0 1 2
do
	c=$(sed -n "/^[ \t]*android:value[ \t]*=[ \t]*\"${modelNames[$i]}\"/p" "$p"|wc -l)
	if [ $c -eq 1 ]
	then
		oldModelName="${modelNames[$i]}"
		break;
	fi
done

if [ $c -ne 1 ]
then
	echo '找不到对应android:name="model"的android:value="...", 请检查'$p
	exit 43
fi

sed -i "s/\([ \t]*android:value[ \t]*=[ \t]*\)\"${oldModelName}\"/\1\"${modelName}\"/" $p

echo "Done!"
