#!/bin/bash

echo "Enter filename:"
read file

if [ ! -e "$file" ]
then
    echo "File not found!"
    exit
fi

echo "File exists"

echo "Type:"
file "$file"

echo "Information:"
ls -l "$file"