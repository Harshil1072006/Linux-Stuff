#!/bin/bash

#when the condition gets true the loop will be terminated 
#opposite from the while loop !!

num=10

until [[ $num -eq 1 ]]
do
	echo "Value of a is $num"
	let num--
done


