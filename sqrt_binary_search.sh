#!/bin/bash

read -p "Please Enter an integer : " NUMBER
read -p "Please Enter the precision : " PRECISION

# echo NUMBER is $NUMBER

SCALER=$((10**(PRECISION+1)))
NEW_NUMBER=$((SCALER*SCALER*NUMBER))
PTR1=1
PTR2=$NEW_NUMBER

N_LOOP=0
SECONDS=0

while [ $PTR1 -lt $PTR2 ]
do

	MID=$(((PTR1 + PTR2)/2))
    TMP=$((MID*MID))

    if [ $TMP -lt 0 ]
    then
        PTR2=$((MID-1))
        continue
    fi
    
    if [ $TMP -eq $NEW_NUMBER ]
    then
        PTR1=$MID
        echo "Found!"
        break
    elif [ $TMP -lt $NEW_NUMBER ]
    then
        PTR1=$((MID+1))
    else
        PTR2=$((MID-1))
    fi

    N_LOOP=$((N_LOOP+1))
done

echo "The square root of $NUMBER is $((PTR1/SCALER)).$((PTR1%SCALER))"
echo "Took $SECONDS seconds to execute"
echo "Accessed loop $N_LOOP times!"

