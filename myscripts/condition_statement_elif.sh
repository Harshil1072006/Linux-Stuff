#!/bin/bash

read -p "Enter your marks " marks

if [[ $marks -gt 80 ]]
then
	echo "you got forst division !! "
elif [[ $marks -gt 60 ]]
then
	echo "You got second division !!"
else
	echo "You are fail !!!"
fi

