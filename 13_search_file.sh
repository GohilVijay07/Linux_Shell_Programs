#!/bin/bash

echo "Enter directory:"
read dir

if [ ! -d "$dir" ]; then
    echo "Directory not found!"
    exit
fi

echo "Enter filename:"
read file

result=$(find "$dir" -type f -name "$file")

if [ -z "$result" ]; then
    echo "File not found!"
else
    echo "$result"
fi