#!/bin/bash

#check for the root user
if [[ $UID -ne 0 ]]
then
	echo "Please login with the root user"
	exit 1
fi

#user should add atleast one argument as the username 

if [[ ${#} -lt 1 ]]
then
	echo "Please use one argument as the user name !"
	exit 1
fi

#add username as the first argument

user_name="${1}"

#the reamining part should be considered as the comment----using shift command

shift
comment="${@}"

#create password
password=$(date +%s%N)

# create the user 
useradd -c "${comment}" -m $user_name

#check if the user is successfully created or not 

if [[ $? -ne 0 ]]
then
	echo "Your account could not be created !!"
	exit 1
fi

#set the password for the user 

echo "$user_name:$password"  | chpasswd 

#check if the password is successfully created or not 

if [[ $? -ne 0 ]]
then
	echo "the password could not be created !!!"
	exit 1
fi

#force password cahnge on first login

passwd -e $user_name

#display some stuff

echo 
echo "Username : $user_name "
echo
echo "Password : $password"
echo 
echo $(hostname)





