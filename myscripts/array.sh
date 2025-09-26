#!/bin/bash

myArray=(1 2 hi "hello buddy")

echo "${myArray[*]}"
#priny hole array

echo "${#myArray[*]}"
#print the length of the array

echo "${myArray[*]:2:2}"
#range of the array

myArray+=(h a r s h i l 10 7)
#to update the array

echo "${myArray[*]}"

unset myArray[8]
#cant use the minus sign to remove the things here 
#in this we can remove the range of element by for loop
echo "${myArray[*]}"



