#!/bin/bash

NAME=""

echo -e "\t\tEnter name to delete: \c"
read -r NAME
grep "${NAME}" mybook > /dev/null

#if grep returned non 0 name was not found. exit with code 1
if [ $? -ne 0 ]; then
	exit 1;

#Grep found a match
else
	NUM=1
	DEL=1
	#iterate through mybook and display matching entry
	cat mybook | grep -i "${NAME}" | while read -r line  
	do
		#display the names with a number
		echo -e "\t\t${NUM}. $line"
		NUM=$((NUM+1));
	done
        #Get user input for which number to delete
	echo -e "\t\tWhich entry to delete?: \c"	
	read DEL
	NUM=1
	DELSTR=""
	#make a temp file to put new phonebook contents in
	touch tempfile
	#loop through again and count each match
	cat mybook | grep -i "${NAME}" | while read -r line
	do
		#When the entry NUM matches userinput NUM
		if [ $DEL = $NUM ]; then
			DELSTR=$line
			#cat the phonebook without the line matching selection
			cat mybook | grep -v "$DELSTR" >> tempfile
			#Overwrite mybook with temp file
			cat tempfile > mybook
			#delete tempfile
			rm tempfile
			#exit with success code
			touch success
			exit 0
		fi
		#iterate NUM
		NUM=$((NUM+1));
	done
	if [[ -f success ]]; then
	rm success
	exit 0 
	fi
fi
	#number outside of given range
	exit 123;

