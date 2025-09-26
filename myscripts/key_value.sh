#!/bin/bash

declare -A myArray
myArray=( [name]=Someone [age]=20 )

echo "my name is ${myArray[name]}"
echo "my age is ${myArray[age]}"

