#!/usr/bin/env bash

# gets the bachelor-1,2,3 paths, extracts the directory's name, renames every master.pdf to the course's name and copies it to the appropriate repo directory
 
copy_rename () {
	degree_name=$1 # bachelor or master or phd
	for course_year_path in $HOME/uni/notes/$degree_name-*
	do
		course_year="${course_year_path%+"${course_year_path##*[!/]}"}" # multi-trailing-/ trim
		course_year="${course_year##*/}" # remove everything before the last /
		for course_path in $course_year_path/*/master.pdf
		do
			# checks if file exists
			if [ -f "$course_path" ] ; then
				# gets course's name path
				course_name_path="${course_path%/*}"
				# gets course's name
				course_name="${course_name_path##*/}"
				cp "$course_path" "${PWD}/${degree_name^}/$course_year/$course_name.pdf"
			fi
		done
	done
}

copy_rename bachelor
copy_rename master
