# Power Menu
As Windows 10 lacks ability to pin Sleep command as a tile I created simple scripts that recrate 4 main actions of power menu and can be pinned to Menu Start.

These actions are:
* Sleep
* Lock
* Reboot
* Shutdown

## Dependencies
These scripts require `psshutdown.exe` from [PsTools](https://docs.microsoft.com/en-us/sysinternals/downloads/psshutdown) in order to work.

## Instalation
1. Extract `psshutdown.exe` (or all PsTools) into `%windir%\System32`
1. Copy the scripts files into `%windir%\System32`
1. Copy all icons (from `/icons` dir) into `%windir%\System32`
1. Copy the shortcuts into `%APPDATA%\Microsoft\Windows\Start Menu\Programs`
1. Pin shortcuts to Menu Start
