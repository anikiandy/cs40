#!/bin/bash

SEL=0;
while [[ $SEL != "5" ]]; 
do
SEL=0;
clear	
echo -n "$(cat menu)"
read SEL;
case $SEL in
	"5")
		exit 0;;
	"1")
		MOAR=1
		YN='0'
		while [ $MOAR -ne 0 ]
		do
			./add.sh
			if [ $? = 0 ]; then
				echo -e "\t\tAdded Successfully!"
			elif [ $? = 1 ]; then
				echo -e "\t\tInvalid Entry!"
			fi
			echo -e "\t\tWould you like to add another? (y/n) \c"
			read YN;
			while [[ $YN != 'n' ]] && [[ $YN != 'y' ]] 
			do	
				echo -e "\t\tWould you like to add another? (y/n) \c"
				read YN;
			done
			if [ $YN = 'n' ]; then
				MOAR=0;
			fi	
		done
		;;
	"2")
		./del.sh
		code=$?
		if [ $code = 0 ]; then
			echo -e "\t\tSuccessfuly removed entry"
		elif [ $code = 1 ]; then
			echo -e "\t\tEntry was not found!"
		else
			echo -e "\t\tInvalid Selection!"
		fi
		;;
	"3")
		cat mybook
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



