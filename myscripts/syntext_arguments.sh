#!/bin/bash

#this will say all the steps in the output
set -x
#this step "set -x"
if [[ $# -eq 0 ]]
then
	echo "please enter some arguments in the CL"
	exit
fi

echo "The first arg is : $1"
echo "The second arg is : $2"

echo "all the args are : $@"
echo "The number of the args are: $#"
