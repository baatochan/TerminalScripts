#!/bin/sh

for d in *; do
	if [ -d "${d}" ]; then
		7z a -t7z -m0=lzma2 -mx=0 -mfb=64 -md=32m -ms=on -mhe=off -p'$$$password$$$' "${d}".7z "./${d}/*"
		if [ $? -eq 0 ]; then
			rm -rf "${d}"
		fi
	fi
done
