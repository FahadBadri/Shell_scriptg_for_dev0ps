#!/bin/bash
#
#
<<disclaimer
This is just checking Conditions
disclaimer

read -p "What do you want: " Yes
read -p "How Much youve Got: " Number

#this is Function definition

function is_loyal(){

if [[ $Yes == "Test" ]];
then
	echo "The Test is working"
elif [[ $Number -ge 100 ]];
then
	echo"Youve got them all"
else
	echo "Its not Working"
fi
}

#this is function calling
is_loyal


