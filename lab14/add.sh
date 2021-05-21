#!/bin/bash
SUM=0
while [ $# -ne 0 ]
do
	SUM=$(($SUM+$1))
	shift
done
echo  $SUM
