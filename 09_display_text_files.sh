#!/bin/bash

# Practical 9: Display ASCII/text files from a specified directory.
# If no directory is given, the current directory is used.

if [ "$#" -eq 0 ]; then
    dir="."
elif [ "$#" -eq 1 ]; then
    dir=$1
else
    echo "Usage: $0 [directory]"
    exit 1
fi

if [ ! -d "$dir" ]; then
    echo "Error: Directory not found: $dir"
    exit 1
fi

found=0

for file in "$dir"/*; do
    if [ -f "$file" ] && file "$file" | grep -qiE 'text|ASCII'; then
        echo "$file"
        found=1
    fi
done

if [ "$found" -eq 0 ]; then
    echo "No ASCII/text files found in: $dir"
fi
