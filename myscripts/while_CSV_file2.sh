#!/bin/bash

#awk is used for the scanning the patterns
cat name.csv | awk 'NR!=1' | while IFS=" " read id name age
do
	echo "the id is $id"
	echo "the name is $name"
	echo "the age is $age"
done

