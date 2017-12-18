#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: sapphire_c_install <mode> <version>"
	exit 11
fi

version="$2"
model="$1"

destdir="c:\\work\\apk\\sapphire-c-${model}"
filename="rockrobo_vacuum-${version}-0.1.${version}-release.apk"

fullpath="${destdir}\\${filename}"

#stop smart home
adb shell am force-stop com.xiaomi.smarthome

#start smart home
adb shell am start com.xiaomi.smarthome/.SmartHomeMainActivity

#push apk
adb push "${fullpath}" "/sdcard/SmartHome/plugin/debug/1.mpk"

#install
adb shell am broadcast -a com.xiaomi.smarthome.action.OPEN_API --es type plugin_debug --es sub_type debug_package
