#!/bin/bash

#getting the file from the path and than execute it or use it

PATH="/home/someone/Desktop/myscripts/name.txt"

for name in $(/bin/cat $PATH)
do
	echo "the names are $name"
done

