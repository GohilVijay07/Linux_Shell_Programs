# Write a shell script to display all ASCII/text files from a specified directory. If no directory is provided as a command-line argument, the program should display the ASCII/text files from the current directory.

#!/bin/bash

if [ $# -eq 0 ]
then
    dir="."
else
    dir=$@
fi

for file in "$dir"/*
do
    if [ -f "$file" ]
    then
        file "$file" | grep -q "text"
        if [ $? -eq 0 ]
        then
            echo "$file"
        fi
    fi
done