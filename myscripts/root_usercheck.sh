#!/bin/bash

if [[ $UID -eq 0 ]]
then 
	echo "The user is ROOT"
else
	echo "The user is not ROOT"
fi

