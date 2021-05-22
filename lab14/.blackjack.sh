#!/bin/bash
#SUMp=0
declare -a CARDSp
#SUMd=0
declare -a CARDSd
CONTINUE=1
#ARRAY FOR NAMES NSTUFF
declare -A cardVal=([2]=2 [3]=3 [4]=4 [5]=5 [6]=6 [7]=7 [8]=8 [9]=9 [10]=10 [Jack]=10 [King]=10 [Queen]=10 [Ace]=11)
cardName=( 2 3 4 5 6 7 8 9 10 Jack King Queen Ace )

#showHand function pass 0 for playe 1 for dealer
showHand(){
	if [ $1 = 0 ]; then
		echo "Your hand: ${CARDSp[@]} total: $SUMp"
	else
		echo "Dealers hand: ${CARDSd[@]} total: $SUMd" 
	fi
}

#get card function pass 0 for player pass 1 for dealer
getCard(){
	
	CARD=${cardName[$(($RANDOM%13))]}
	if [ $1 = 0 ]; then
		SUMp=$((SUMp+${cardVal[$CARD]}))
		CARDSp+=($CARD)
	else
		SUMd=$((SUMd+${cardVal[$CARD]}))
		CARDSd+=($CARD)
	fi
}

while [ $CONTINUE = 1 ]
do

clear
SUMp=0
SUMd=0
BUSTp=0
BJp=0
BJd=0
BUSTd=0
HIT=1
unset CARDSd
unset CARDSp
echo "!~!~!~!~!~!~!~BLACKJACK!~!~!~!~!~!~!~!"

#Generate Player hand
getCard 0
getCard 0
getCard 1
getCard 1
#check for bJ



if [ $SUMp = 21 ]; then
	showHand 0;
	BJp=1
	HIT=0
fi
if [ $SUMd = 21 ]; then
	HIT=0
	BJd=1
fi
while [ $HIT = 1 ]
do
	showHand 0
	sel=0
	
	#check for bust
	if [ $SUMp -gt 21 ]; then
		echo "Bust You lose!"
		HIT=0
		BUSTp=1
	fi
	##hit or stay
	while [[ $sel != "h" ]] && [[ $sel != "s" ]] && [[ $BUSTp = 0 ]] 
	do
		echo -e "would you like to hit or stay? (h/s): \c"
		read -r sel
	done
	if [[ $sel = "h" ]]; then
		getCard 0
	else
		HIT=0;
	fi
done

##dealeri

#hit until we exceed 17
while [ $SUMd -lt 17 ]
do
	getCard 1
done

#check if we bust
if [ $SUMd -gt 21 ]; then
	BUSTd=1;
fi

##possble outcomes
clear
echo "!~!~!~!~!~!~!~BLACKJACK!~!~!~!~!~!~!~!" 
while true
	do
		##blackjacks
		if [ $BUSTp = 1 ]; then
			showHand 0
			echo "Busted! You lose!"
			break
		fi
		if [ $BJp = 1 ] && [ $BJd = 0 ]; then
			showHand 0
			echo "BJ you win!"
			break
		elif [ $BJd = 1 ] && [ $BJp = 0 ]; then
			showHand 0
			showHand 1
			echo "Dealer has blackjack"
			break;
		fi
showHand 0		
showHand 1
		if [ $BJp = 1 ] && [ $BJd = 1 ]; then
			echo "2xBJs! Tie!"
			break
		elif [ $BUSTp = 0 ] && [ $BUSTd = 0 ]; then
		      if [ $SUMp -gt $SUMd ]; then
		      	echo "You win!"
			break
		      elif [ $SUMp -lt $SUMd ]; then
	      		echo "You Lose!"
  			break
		      elif [ $SUMp = $SUMd ]; then
      			echo "It's a tie!"
			break
		      fi
	         elif [ $BUSTd = 1 ]; then 
  			echo "Dealer Busts you win!"
			break
		 else
			break
		fi
	done
cont=x
	while [[ $cont != 'y' ]] && [[ $cont != 'n' ]]
	do
		echo -e "Would you like to play again? (y/n): \c"
		read -r cont
	done
if [[ $cont = 'n' ]]; then 
	CONTINUE=0;
fi

done
