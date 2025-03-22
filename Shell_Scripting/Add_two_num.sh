#!/bin/bash


#Author: Narasimha Reddy
#Desc: Script to add numbers
#Version: v1
##########################

set -x
set -e

num1=$1
num2=$2

sum=$((num1 + num2 ))

echo "The sum of numbers :  $sum"
echo "The total no of arguments : $#"
echo "The status code is : $?"

