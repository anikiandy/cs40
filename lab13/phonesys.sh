#!/bin/bash

SEL=0;
while [ $SEL -ne 5 ]; 
do
SEL=0;
clear	
echo -n "$(cat menu)"
read SEL;
case $SEL in
	"5")
		exit 0;;
	"1")
		./add.sh
		if [ $? = 0 ]; then
			echo -e "\t\tAdded Successfully!"
		elif [ $? = 1 ]; then
			echo -e "\t\tEntry already exists!"
		fi
		;;
	"2")
		#del
		;;
	"3")
		#list file or entry
		;;
	"4")
		#change
		;;
	*)
		echo -e "\t\tInvalid Entry!"
esac
echo -e "\t\tEnter to continue\c"
read >> /dev/null
done



