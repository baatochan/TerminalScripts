#!/bin/bash

backup_loc="/backup"

cd /home/

for group in *; do
        if [ "$group" == "baatochan" ]; then
                continue
        fi
        if [ -d "$group" ]; then
                for user in "$group"/*; do
                        tar -cg "$backup_loc"/"$user"/data.snar -f "$backup_loc"/"$user"/"$(date +%s)".tar "$user"
                done
        fi
done
