#!/bin/bash

#when the condition gets false the loop will be terminated.
count=0
num=10

while [ $count -le $num ]
do
	echo "num is $count"
	let count++
done

