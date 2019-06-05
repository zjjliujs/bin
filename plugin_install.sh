#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: plugin_install <apk-file>"
	exit 11
fi

fullpath="$1"

#stop smart home
adb shell am force-stop com.xiaomi.smarthome

#start smart home
adb shell am start com.xiaomi.smarthome/.SmartHomeMainActivity

#push apk
adb push "${fullpath}" "/sdcard/SmartHome/plugin/debug/1.mpk"

#install
adb shell am broadcast -a com.xiaomi.smarthome.action.OPEN_API --es type plugin_debug --es sub_type debug_package
