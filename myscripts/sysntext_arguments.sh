#!/bin/bash

set -x
echo "the first arg is : $1"
echo "the second arg is : $2"

echo "ALL THE arg are : $@"
echo "ALL number of arg are : $#"

for filename in $@
do
	echo "THE FILEname is : $filename"
done
