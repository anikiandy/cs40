#!/bin/bash

NAME=0
echo -e "\t\tEnter name to chaange: \c"
read NAME

grep -i $NAME mybook > /dev/null
if [ $? -ne 0 ]; then
	echo -e "\t\tEntry not found!"
	exit 1;
fi

COUNT=1
CHANGE=0
cat mybook | grep -i "$NAME" | while read line
do
	echo -e "\t\t$COUNT. $line"
	COUNT=$((COUNT+1))
done

COUNT=1
CHOICE=0
echo -e "\t\tWhich line will be changed?: \c"
read CHANGE
clear
echo -e "$(cat submenu2) \c"
read CHOICE;

if [[ $CHOICE == "1" ]]; then
	echo -e "\t\tWhat is the new name?: \c"
	read -r NEWTHING
elif [[ $CHOICE == "2" ]]; then
	echo -e "\t\tWhat is the new number: \c"
	read -r NEWTHING
else 
	echo -e "\t\tInvalid Entry!"
fi


cat mybook | grep -i "$NAME" | while read line
do
	if [[ $COUNT == $CHANGE ]]; then
	#cut number
		if [[ $CHOICE == "1" ]]; then
			NUM=$(echo $line | cut -d":" -f2 | cut -d' ' -f2) 
			NEWTHING=$(echo "$NEWTHING: $NUM")
			sed -i '' "s/$line/$NEWTHING/g" mybook
			echo -e "\t\tThe new entry is: $NEWTHING"
			exit 0
		elif [[ $CHOICE == "2" ]]; then
			NAME=$(echo $line | cut -d":" -f1)
			NEWTHING=$(echo "$NAME: $NEWTHING") 
			sed -i '' "s/$line/$NEWTHING/g" mybook
			echo -e "\t\tThe new entry is: $NEWTHING"
			exit 0
		fi	       
	fi
	COUNT=$((COUNT+1))

done

