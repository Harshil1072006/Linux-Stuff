#!/bin/bash

read -p "Enter the site name :" site

ping -c 1 $site &> /dev/null
#sleep 5s
#in this if we enter wrong command even then the if confition will give us successfully pingged bcz the sleep command is been executed the last

if [[ $? -eq 0 ]]
then
	echo "the site is been successfully pingged!!! "
else
	echo "error occurs, check the site syntext"
fi


