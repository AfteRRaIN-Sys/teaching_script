#!/bin/bash

function print_user_prompt {
	# echo input with delay
	# params
	# $1 : prompt
	# $2 : delay (default 2)
	
	if [ -z "$1" ]
	then
		echo "No given prompt, returning..."
        return
        echo lol # -> this will be skipped
	else
		echo $1
	fi

	if test -z $2
	then
		sleep 2
	else
		sleep $2
	fi
}

function launch_user_shell {
	read -p $'\t'"$NAME@($(pwd)) > " CMD
	eval $CMD
}

echo
print_user_prompt "before starting, please make sure the directory is safe to manipulate!"
print_user_prompt "These following files and directories will be deleted :"
print_user_prompt $'\n'"--> $(ls -A | grep -v scripting_tutorial)"

read -p $'\n'"> Confirm (y/n)? " CONFIRM

if [ $CONFIRM != "y" ]
then
	echo "Good luck!"
	exit
fi


# set up
rm -rf $(ls | grep -v scripting_tutorial)

# declaring VAR
MYNAME="Phet"
i=0
total=7

echo
print_user_prompt "Hello, I am ${MYNAME}. Nice to meet you!"

# read input
echo
read -p "And, What's your name? : " NAME
sleep 2

echo "Hello K'$NAME"
sleep 1
echo "And Welcome to this scripting tutorial!"
sleep 2


print_user_prompt "You're logging as $(whoami)" 1
print_user_prompt "Your current working directory : $(pwd)"


print_user_prompt "Task 1: Create & remove files and directory" 1
print_user_prompt "-> TODO 1.1: Please create a file \"file1.txt\" (Press \"Enter\" When You are done)"$'\n'

# task 1 setup

mkdir -p folder1/to_remove
touch folder1/to_delete_1.txt
touch folder1/to_remove/to_delete_2.txt

while true
do 
	launch_user_shell
	if [ -f "file1.txt" ]
	then
		sleep 2
		i=$((i+1))
		print_user_prompt $'\n\t'"> You got it right ($i/$total)!!"$'\n'
		break
	fi
done

echo "-> TODO 1.2: Please remove folder1 and its contents (Press \"Enter\" When You are done)"$'\n'

while true
do 
	launch_user_shell
	if [ ! -d "folder1" ]
	then
		sleep 2
		i=$((i+1))
		print_user_prompt $'\n\t'"> You got it right ($i/$total)!!"$'\n'
		break
	fi
done

print_user_prompt "Task 2: Moving files"
echo
print_user_prompt "-> TODO 2: Please move \"to_move\" to \"dir2/new_file.txt\"  (Press \"Enter\" When You are done)" 0
print_user_prompt "Hint 1): No one can hide from -a(ll) option" 0
print_user_prompt "Hint 2): 'tree' might be able to help!"$'\n'

# task 2 set up
mkdir dir1
mkdir dir2
touch dir1/.to_move

while true
do 
	launch_user_shell
	if [ ! -f "dir1/.to_move" -a -f "dir2/new_file.txt" ]
	then
		sleep 2
		i=$((i+1))
		print_user_prompt $'\n\t'"> You got it right ($i/$total)!!"$'\n'
		break
	fi
done

print_user_prompt "Task 3: Q&A" 1
echo
print_user_prompt "-> TODO 3: Choose the correct Answer (Press \"Enter\" When You are done)"$'\n' 1

# Q1
echo
print_user_prompt "Q : What is the main differences between each variation of shells?"
print_user_prompt "=> a) Interfaces | b) Syntax & Functions | c) None of the above"$'\n' 0


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

