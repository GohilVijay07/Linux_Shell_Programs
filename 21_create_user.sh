#!/bin/bash

echo "Enter username:"
read username

if id "$username" &>/dev/null
then
    echo "User already exists!"
else
    sudo useradd -m "$username"

    if [ $? -eq 0 ]
    then
        echo "User created successfully!"
    else
        echo "User creation failed!"
    fi
fi