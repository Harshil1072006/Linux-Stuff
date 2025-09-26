#!/bin/bash

echo "provide an option"
echo "A) for date"
echo "B) for scrits"
echo "C) for current directories"

read choice

case $choice in 
	#A)date;; you can do this also
	A)
	echo "Today's date"
	date
	echo "ending!!!"
	;;
	B)ls;;
	C)pwd;;
	*)echo "please enter a valid input"
esac

