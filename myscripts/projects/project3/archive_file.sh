#!/bin/bash
#$Revision:001$
#$Wednesday 23 July 2025 03:12:24 PM IST$

#Variables
base=/home/someone/Desktop/myscripts/projects/project3/
days=10
depth=1
run=0

#Check if the directory is present or not 
if [[ ! -d $base ]]
then
	echo "Please selecet the correct directory!!"
	exit 1
fi

#Create the archive folder if not exist
if [[ ! -d $base/archive ]]
then
	mkdir $base/archive
fi

#find the list of larger files more than 20MB

for i in `find $base -maxdepth $depth -type f -size +20M`
do
	if [ $run -eq 0 ]
	then
			gzip $i || exit 1
			mv $1.gz $base/archive || exit 1
	fi
done

