#!/bin/bash
#
#
<<Loop
this is example of for loop
Loop

# Loop through this loop
for item in apple mango banana
do
	echo "These are Fruits"
done

# Loop suing c-style syntax
for (( num=1;num<5;num++ ))
do
	mkdir "${1}${num}"
done

