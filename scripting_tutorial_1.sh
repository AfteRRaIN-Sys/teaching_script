#!/bin/bash

# set up
rm -rf $(ls | grep -v scripting_tutorial)

# declaring VAR
MYNAME="Phet"
i=0
total=7

echo
echo "Hello, I am ${MYNAME}. Nice to meet you!"
sleep 2

# read input
echo
read -p "And, What's your name? : " NAME
sleep 2

echo "Hello K'$NAME"
sleep 1
echo "And Welcome to this scripting tutorial!"
sleep 2

echo
echo "You're logging as $(whoami)"
sleep 1
echo "Your current working directory : $(pwd)"
sleep 2


echo
echo "Task 1: Create & remove files and directory"
sleep 1
echo
echo "-> TODO 1.1: Please create a file \"file1.txt\" (Press \"Enter\" When You are done)"$'\n'
sleep 2

# task 1 setup

mkdir -p folder1/to_remove
touch folder1/to_delete_1.txt
touch folder1/to_remove/to_delete_2.txt

while true
do 
	read -p $'\t'"$NAME@($(pwd)) > " CMD
	# $CMD
	eval $CMD
	if [ -f "file1.txt" ]
	then
		sleep 2
		i=$((i+1))
		echo $'\n\t'"> You got it right ($i/$total)!!"$'\n'
		sleep 2
		break
	fi
done

echo "-> TODO 1.2: Please remove folder1 and its contents (Press \"Enter\" When You are done)"$'\n'

while true
do 
	read -p $'\t'"$NAME@($(pwd)) > " CMD
	# $CMD
	eval $CMD
	if [ ! -d "folder1" ]
	then
		sleep 2
		i=$((i+1))
		echo $'\n\t'"> You got it right ($i/$total)!!"$'\n'
		sleep 2
		break
	fi
done

echo "Task 2: Moving files"
echo
sleep 1
echo "-> TODO 2: Please move \"to_move\" to \"dir2/new_file.txt\"  (Press \"Enter\" When You are done)"
echo "Hint 1): No one can hide from -a(ll) option"
echo "Hint 2): 'tree' might be able to help!"$'\n'
sleep 1

# task 2 set up
mkdir dir1
mkdir dir2
touch dir1/.to_move

while true
do 
	read -p $'\t'"$NAME@($(pwd)) > " CMD
	# $CMD
	eval $CMD
	if [ ! -f "dir1/.to_move" -a -f "dir2/new_file.txt" ]
	then
		sleep 2
		i=$((i+1))
		echo $'\n\t'"> You got it right ($i/$total)!!"$'\n'
		sleep 2
		break
	fi
done

sleep 1
echo "Task 3: Q&A"
echo
sleep 1
echo "-> TODO 3: Choose the correct Answer (Press \"Enter\" When You are done)"$'\n'

# Q1
echo "Q : What is the main differences between each variation of shells?"
echo "=> a) Interfaces | b) Syntax & Functions | c) None of the above"$'\n'


read -p $'\t'"$NAME@($(pwd)) > " CMD
sleep 1
if [ $CMD == "b" ]
then
	sleep 1
	i=$((i+1))
	echo $'\n\t'"> You got it right ($i/$total)!!"$'\n'
else
	echo $'\n\t'"> Pretty close! The answer is b) Syntax & Functions ($i/$total)!!"$'\n'
fi

# Q2
echo "Q : Suppose K'$NAME want to remove a write permission from a file, which is the command to achieve that?"
echo "=> a) chmod -w | b) chattr -w | c) rm -w"$'\n'


read -p $'\t'"$NAME@($(pwd)) > " CMD
sleep 1
if [ $CMD == "a" ]
then
	sleep 1
	i=$((i+1))
	echo $'\n\t'"> You got it right ($i/$total)!!"$'\n'
else
	echo $'\n\t'"> Pretty close! The answer is a) chmod -w ($i/$total)!!"$'\n'
fi

# Q3
echo "Q : Which command is used to call a built-in text editor from shell?"
echo "=> a) vim | b) code | c) nano"$'\n'


read -p $'\t'"$NAME@($(pwd)) > " CMD
sleep 1
if [ $CMD == "c" ]
then
	sleep 1
	i=$((i+1))
	echo $'\n\t'"> You got it right ($i/$total)!!"$'\n'
else
	echo $'\n\t'"> Pretty close! The answer is c) nano ($i/$total)!!"$'\n'
fi

# Q4
echo "Q : What is the purpose of command 'alias' (what is it used for)?"
echo "=> a) clear shell screen  b) create a new variable  c) None of the above"$'\n'


read -p $'\t'"$NAME@($(pwd)) > " CMD
sleep 1
if [ $CMD == "c" ]
then
	sleep 1
	i=$((i+1))
	echo $'\n\t'"> You got it right ($i/$total)!!"$'\n'
else
	echo $'\n\t'"> Pretty close! The answer is c) None of the above ($i/$total)!!"$'\n'
fi

echo
sleep 1
echo "Congratulations! You've passed the excercise with total score of $i/$total !!!"

if [ $i -eq $total ]
then
	echo "Which is a perfect score! Excellent!"
elif [ $i -gt 4 ]
then
	echo "Which is Very Good! Keep it up!"
else
	echo "Which is nice! With a little more practice, would be perfect!"
fi

# clean up

echo $'\n'"cleanning up the folder..."
sleep 1
echo .
sleep 1
echo .
sleep 1
echo .
echo "Have a nice day..."
rm -rf $(ls | grep -v scripting_tutorial)

