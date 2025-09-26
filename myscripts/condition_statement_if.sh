#!/bin/bash

read -p "Enter your marks " marks

if [[ $marks -gt 40 ]]
then
	echo "You are pass"
else
	echo "You are fail!!!!!!"
fi

<<coment

equal             ---> -eq OR ==
grater than equal ---> -ge
less 		  ---> -le
not equal 	  ---> -ne OR !=
grater 		  ---> -gt
less		  ---> -lt

coment

