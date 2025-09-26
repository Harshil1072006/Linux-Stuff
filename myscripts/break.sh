#!/bin/bash

no=6

for i in 1 2 3 4 5 6 7 8 9 10
do
	if [[ $no -eq $i ]]
	then
		echo "the number is found!!,it's $i"
		#this break will break the loop here means the last echo stuff written will not executed!
		break
	fi
	echo "the number is $i"
	
done
