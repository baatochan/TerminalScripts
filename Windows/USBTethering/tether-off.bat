REM https://stackoverflow.com/questions/20226924/is-it-possible-to-usb-tether-an-android-device-using-adb-through-the-terminal
echo Turning off USB tethering - make sure the device is connected, the computer have adb permission granted and root access for adb is permitted.
adb shell su -c service call connectivity 33 i32 0 s16 text
