#!/bin/bash

read -p "Please Enter an integer : " NUMBER
read -p "Please Enter the precision : " PRECISION

# echo NUMBER is $NUMBER

SCALER=$((10**(PRECISION+1)))
NEW_NUMBER=$((SCALER*SCALER*NUMBER))
PTR=1

SECONDS=0

while [ $((PTR*PTR)) -lt $NEW_NUMBER ]
do
	PTR=$((PTR+1))
done

echo "The square root of $NUMBER is $((PTR/SCALER)).$((PTR%SCALER))"
echo "Took $SECONDS seconds to execute"
echo "Accessed loop $PTR times!"

