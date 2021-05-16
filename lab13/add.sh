#!/bin/bash
#lets return 0 for success, 1 for entry exists
NAME=""
NUM=""
echo -e "\t\tName to add: \c ";
read -r NAME

grep "$NAME" mybook > /dev/null
if [ $? = 0 ]; then
	exit 1;
else
	echo -e "\t\tEnter number: \c"
	read -r NUM
	echo "${NAME}: $NUM" >> mybook
	exit 0;
fi

