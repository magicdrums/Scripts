#! /bin/bash
# Necessary:
# Rooted Phone
# Android 4.1.0 or mayor

PATH=$PATH:/system/xbin:/system/bin

ADB=/usr/bin/adb
$ADB shell am start -a android.intent.action.SENDTO -d sms:$1 --es sms_body "$2" --ez exit_on_sent true
sleep 1
$ADB shell input keyevent 22
sleep 1
$ADB shell input keyevent 66
