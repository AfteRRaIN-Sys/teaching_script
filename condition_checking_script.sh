#!/bin/bash

echo "Running script..."$'\n'

VAR=$1

if [ $VAR -gt 2 -a $VAR -lt 99 ]
then
	echo "2 < \"$VAR\" < 99"
else
	echo "Not in range!"
fi

if [ -d dir1 ]
then
	echo "dir1 exists"
else
	echo "dir1 not exists"
fi

if [ -f file1 ]
then
	LOG1="file1 exists!!"

	if [ -s  file1 ]
	then
		LOG2="& it is not empty! (head: $(head -1 file1))"
	else
		LOG2="but it is empty!"
	fi

	echo $LOG1 $LOG2
else
	echo "file1 does not exists"
fi

if [ -f file2 ]
then
	LOG1="file2 exists!!"

	if [ -s  file2 ]
	then
		LOG2="& it is not empty! (head: $(head -1 file2))"
	else
		LOG2="but it is empty!"
	fi

	echo $LOG1 $LOG2
else
	echo "file2 does not exists"
fi

if [ ! $VAR -gt 99 -a $VAR -ge 80 ] #
then
	echo  $VAR "not > 99 (<= 99) and >= 80"
elif [ ! $VAR -ge 99 -a ! $VAR -le 40 ] #
then
	echo  $VAR "in between 41 - 98"
# if [ ! $($VAR -ge 99 -a ! $VAR -le 40) ] # don't
# then
# 	echo  $VAR "<99 or <40"
fi

echo Exitting...
