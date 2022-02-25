#!/usr/bin/env bash

# gets the bachelor-1,2,3 paths, extracts the directory's name, renames every master.pdf to the course's name and copies it to the appropriate repo directory
for DIR_PATH in $HOME/uni/bachelor-*
do
	DIR_NAME="${DIR_PATH%+"${DIR_PATH##*[!/]}"}" # multi-trailing-/ trim
	DIR_NAME="${DIR_NAME##*/}" # remove everything before the last /
	for FILE_PATH in $DIR_PATH/*/master.pdf
	do
		# checks if file exists
		if [ -f "$FILE_PATH" ] ; then
			# gets course's path
			COURSE_PATH="${FILE_PATH%/*}"
			# gets course's name
			FILE_NAME="${COURSE_PATH##*/}"
			cp "$FILE_PATH" "${PWD}/$DIR_NAME/$FILE_NAME.pdf"
		fi
	done
done
