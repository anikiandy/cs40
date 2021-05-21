#!/bin/bash
#lets return 0 for success, 1 for entry exists
NAME=""
NUM=""
echo -e "\t\tName to add: \c ";
read -r NAME
echo -e "\t\tEnter number: \c"
read -r NUM
if [[ $NAME != "" ]] && [[ $NUM != "" ]]; then
	echo "${NAME}: $NUM" >> mybook
	exit 0;
else 
	exit 1;
fi

