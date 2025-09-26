#!/bin/bash

array=( 2 4 5 hello hi "good morning")
length=${#array[*]}

for(( i=0;i<$length;i++))
do
	echo "Names are ${array[$i]}"
done


