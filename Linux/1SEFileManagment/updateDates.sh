#!/bin/bash

for f in *; do
	if [[ -d "${f}" ]]; then
		if [[ -e "${f}/clip.mp4" ]]; then
			correctDate=$(( f + 100 ))
			correctDateWithTime="${correctDate}0600"
			year=${correctDate:0:4}
			month=${correctDate:4:2}
			day=${correctDate:6:2}
			exifdate="${year}:${month}:${day} 06:00:00"

			echo $correctDate

			~/.local/share/Image-ExifTool-11.92/exiftool -QuickTime:CreateDate="$exifdate" ${f}/clip.mp4
			~/.local/share/Image-ExifTool-11.92/exiftool -QuickTime:ModifyDate="$exifdate" ${f}/clip.mp4
			~/.local/share/Image-ExifTool-11.92/exiftool -QuickTime:TrackCreateDate="$exifdate" ${f}/clip.mp4
			~/.local/share/Image-ExifTool-11.92/exiftool -QuickTime:TrackModifyDate="$exifdate" ${f}/clip.mp4
			~/.local/share/Image-ExifTool-11.92/exiftool -QuickTime:MediaCreateDate="$exifdate" ${f}/clip.mp4
			~/.local/share/Image-ExifTool-11.92/exiftool -QuickTime:MediaModifyDate="$exifdate" ${f}/clip.mp4

			touch -t $correctDateWithTime ${f}/clip.mp4
			touch -a -t $correctDateWithTime ${f}/clip.mp4
			touch -m -t $correctDateWithTime ${f}/clip.mp4
			
			rm -rf ${f}/clip.mp4_original
		fi
	fi
done
