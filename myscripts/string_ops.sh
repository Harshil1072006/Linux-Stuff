#!/bin/bash

myVar="hey buddy, how you doing?"

myVarLength=${#myVar}
echo "length is $myVarLength"

echo "${myVar^^}"

echo "${myVar,,}"

#To replace the words
replace=${myVar/you/U}

echo "$replace"

echo "after slicing ${myVar:4:5}"

