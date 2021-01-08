#!/bin/bash

backup_loc="/backup"
older_backup_loc="/backup-older"

rm -rf "$older_backup_loc"
mv "$backup_loc" "$older_backup_loc"

cd /home/

for group in *; do
        if [ "$group" == "baatochan" ]; then
                continue
        fi
        if [ -d "$group" ]; then
                for user in "$group"/*; do
                        mkdir -p "$backup_loc"/"$user"/
                        tar -cg "$backup_loc"/"$user"/data.snar -f "$backup_loc"/"$user"/data.tar "$user"
                done
        fi
done
