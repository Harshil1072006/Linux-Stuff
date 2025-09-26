#!/bin/bash

read -p "Enter the full file path: " filepath

if [[ -f $filepath ]]
then
	echo "The file path is correct"
else
	#if you want to create the file if not exist then go for this !
	read -p "there is no file name so, enter the file name: " file
	echo "file is creating !!"
	sleep 1s
	touch "$file"
	echo "now it's ready"


	#echo "file path is incorrect"
	#exit 1
fi

