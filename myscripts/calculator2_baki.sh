#!/bin/bash


echo "The calculator is here:"
echo "Enter 2 values for the calculation"
read num1
read num2
echo "now enter your 1 for sum "
echo "2 for subtrcation "
echo "3 for multiplication "
echo "4 for division "
read choice


sum() {
	local num1=$1
	local num2=$2
	let summmition=num1+num2
	$summition
}

subtraction() {
	echo $(($num1-$num2))
}

multi() {
	echo $(($num1*$num2))
}

division() {
	echo $(($num1/$num2))
}

case $choice in
	1) 
		sum $n1 $n2
		;;
	2) subtraction ;;
	3) multi ;;
	4) division ;;
	*) echo "please enter the valid value" ;;
esac
