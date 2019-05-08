#!/bin/bash

mkdir -p clips

for f in *; do
    if [[ -d "$f" ]]; then
		if [[ -e "${f}/clip.mp4" ]]; then
			#echo "$f"
			mv "${f}/clip.mp4" "clips/${f}.mp4"
		else
			#echo "$f"
			echo "$f" >> missing.txt
		fi
    fi
done