#!/bin/bash

#I tried some stuff but the the actual this is in the first 4 lines
echo "how many time you want to run this function?"
read choice
function myfunc {
	echo "hi"
}



for (( i = 0;i < $choice ;i++ ))
do
	echo ""
	myfunc
	echo ""
done
#another way to make a function 

myfunc (){
	echo "hello $1"
	echo "the age is $2"
}
#$1 means first arument and $2 means second argument
myfunc harshil 20
myfunc hvzsd 50
myfunc hfdfvdf 42
