#!/bin/bash

fu=$(df -H | grep "sda1" | awk '{print $5}' | tr -d %)
TO=harshilpanchal107@gmail.com

if [[ $fu -gt 50 ]]
then
	echo "Warning, disk space is low : $fu %" | mail -s "DISK SPACE ALERT!!" $TO
else
	echo "All good"
fi

