@echo off

rmdir result /s /q
mkdir result

set numberOfDaysToPull=14

set day=%date:~0,2%
set month=%date:~3,2%
set year=%date:~6,2%

set /A filename=20%year%%month%%day%
set /A filename=%filename%-100
set /A filename=%filename%-%numberOfDaysToPull%

set /A terminator=%filename%+%numberOfDaysToPull%+1

:loop
echo Pulling %filename%
adb pull "/sdcard/.1second/time_cc_My Life/%filename%" result/

set /A filename=%filename%+1
if %filename%==%terminator% goto endOfLoop
goto loop

:endOfLoop
