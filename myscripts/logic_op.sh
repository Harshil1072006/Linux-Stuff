#!/bin/bash

read -p "your age is " age
read -p "your country is " country
#you can use OR operator at the AND operator and check
if [[ $age -ge 18 && $country == "india" ]]
then
	echo "you can vote"
else
	echo "you can't vote"
fi

