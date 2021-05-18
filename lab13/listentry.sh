#!/bin/bash

if [ $# -ne 1 ]; then
	exit 1
fi

if [[ $1 == "2" ]];
then
	cat mybook | while read line
do
	echo -e "\t\t$line"
done
exit 0;
elif [[ $1 == "1" ]]; then
	echo -e "\t\tEnter name to list: \c"
	read NAME
	cat mybook | grep -i "$NAME" | while read line
do
	echo -e  "\t\t$line"
done
exit 0;
fi
exit 2;


