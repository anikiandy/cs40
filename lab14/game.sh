#!/bin/bash
CHOICE=0
while [ $CHOICE -ne '4' ] 
do
clear;
echo -e "$(cat menu)\c"
read CHOICE
if [[ $CHOICE != 1 ]] && [[ $CHOICE != 2 ]] && [[ $CHOICE != 3 ]] && [[ $CHOICE != 4 ]]; then
	exit 123;
else
clear;
	case $CHOICE in
	1)
		./crap.sh
		;;
	2)
		echo "doin a guess"
		;;
	3)
		echo "doing a bj"
		;;
esac
fi




done
