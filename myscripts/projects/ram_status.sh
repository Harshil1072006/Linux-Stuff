#!/bin/bash

FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')

TH=500

if [[ $FREE_SPACE -lt $TH ]]
then
	echo "YOUR RAM IS GOING VERY DOWN "
else
	echo "You are having a good space in the ram, it is : $FREE_SPACE"
fi

