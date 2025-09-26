#!/bin/bash

cat name.csv | while IFC="," read id name age
do
	echo "The id is $id"
	echo "The name is $name"
	echo "The age is $age"
done
