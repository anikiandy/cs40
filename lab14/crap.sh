#!/bin/bash

PHASE=0
MARK=1
D1=0
D2=0
CONTINUE=1
CRAPPED=0
SUM=0
declare -a rolls

roll(){
	D1=$(($RANDOM%6+1))
	D2=$(($RANDOM%6+1))
	SUM=$(./add.sh $D1 $D2)	
}

while [ $CONTINUE = 1 ]
do
roll
clear
cat << EOF
~-~-~-~-~-~-~-~-~-~-~-~-~-~-
WELCOME TO THE CRAPS TABLE!

Your first roll is:
$D1 and $D2 = $SUM
EOF

while [ $CRAPPED = 0 ]
do
	case $PHASE in
	0)
		#come out
		if [ $SUM = 7 ] || [ $SUM = 11 ]; then
			echo "You win!"
		        CRAPPED=1
		elif [ $SUM = 2 ] || [ $SUM = 3 ] || [ $SUM = 12 ]; then
			echo "You lose"
			CRAPPED=1;
		else
			MARK=$SUM;
			PHASE=1;
			echo "ENTER TO TRY AGAIN FOR $SUM"
			read > /dev/null
		fi	
		;;
	1)
		#Marker out
		if [ $SUM = $MARK ]; then
			echo -e "You  win!\nyour rolls were: ${rolls[@]}"
			CRAPPED=1
		elif [ $SUM = 7 ]; then 
			echo "You lose"
			CRAPPED=1
		else
			rolls+=( $SUM )
			echo -e "ENTER TO TRY AGAIN FOR $MARK"
			read > /dev/null
		fi
			;;
	esac
	if [ $CRAPPED = 0 ]; then
		roll
	echo "your roll was $D1 and $D2 = $SUM"
	fi	
done
play=0
	while [[ $play != "y" ]] && [[ $play != "n" ]]
	do
	echo -e "PLAY AGAIN? (y/n) \c" 
	read -r play
	done
if [[ $play = "n" ]]; then
	CONTINUE=0;
fi
PHASE=0
CRAPPED=0
done

