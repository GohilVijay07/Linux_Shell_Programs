#!/bin/bash

echo "Enter path:"
read path

if [ -L "$path" ]
then
    echo "It is a symbolic link"

elif [ -f "$path" ]
then
    echo "It is a file"

elif [ -d "$path" ]
then
    echo "It is a directory"

else
    echo "Path does not exist"
fi