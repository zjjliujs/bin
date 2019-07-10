#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: plugin_install <apk-file>"
	exit 11
fi

fullpath="$1"

#stop smart home
adb.exe shell am force-stop com.xiaomi.smarthome
echo stop smarthome return code $?

#start smart home
adb.exe shell am start com.xiaomi.smarthome/.SmartHomeMainActivity
echo start smarthome return code $?

#push apk
adb.exe push "${fullpath}" "/sdcard/SmartHome/plugin/debug/1.mpk"
echo push apk to smarthome return code $?

#install
adb.exe shell am broadcast -a com.xiaomi.smarthome.action.OPEN_API --es type plugin_debug --es sub_type debug_package
echo broadcast to smarthome return code $?
