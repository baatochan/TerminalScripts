# 1SE File Management
Scripts for managing the 1SE Android app video base.

* `export1SEFootage.sh`  
	Exports all videos from multidir structure to one dir.
* `findMissing.sh`  
	Looks for missing videos when the video base gets corrupt.
* `pull.bat` _(Batch script!)_  
	`adb-pull`s latest 14 snippets.
* `updateDates.sh`  
	Script that iterates over every directory with name YYYYMMDD with file clip.mp4 in it and sets all dates of this file to YYYY-MM-DD 06:00 AM.
