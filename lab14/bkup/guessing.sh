#!/bin/bash

clear
CONTINUE=0
while [ $CONTINUE = 0 ]
do

while [[ $CHOICE != "1" ]] && [[ $CHOICE != "2" ]] && [[ $CHOICE != "3" ]]
do
clear
cat << EOF
~~~~~~GUESSING GAME~~~~~~~~
1. COLOR TV 
2. FRIDGE
3. AUTO

What is you choice? (1,2,3)
EOF
read -r CHOICE
done
WIN=0
D=0
GUESS=0
TIMER=0
#Generate money
case $CHOICE in
	1)
		D=$(($RANDOM%301+200));;
	2)
		D=$(($RANDOM%301+600));;
	3)
		D=$(($RANDOM%1001+500));;
esac

#Setup game start timer starts when they enter first guess
echo -e "You have 1 minute to guess the price\nWhat is your first guess? \c"
read -r GUESS
TIMER=$(date +%s) 

####~~~~Guessing Loop~~~~######
while [[ $GUESS != $D ]] && [ $(($(date +%s)-$TIMER)) -le 60 ] 
do
  	#COMPARE PRICES 
	delta=$(($D-$GUESS))
	if [ $delta -gt 0 ]; then
		echo -e "Guess higher: \c"
		read -r GUESS
	else
		echo -e "Guess lower: \c"
		read -r GUESS
	fi
	if [[ $GUESS = $D ]]; then
		WIN=1;
	fi
done	
if [ $WIN = 0 ]; then
	echo "Time ran out!"
else
	echo "YOU WIN!"
fi

yn=0
while [[ $yn != 'y' ]] && [[ $yn != 'n' ]]
do
	echo  -e "Play again? (y/n): \c"
	read -r yn
done
if [[ $yn == "n" ]]; then
	CONTINUE=1;
fi

GUESS=0
D=0
CHOICE=0
done
