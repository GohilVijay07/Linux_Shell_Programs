#!/bin/bash

echo "Enter username:"
read username

if id "$username" &>/dev/null
then
    echo "User groups:"
    id -nG "$username"
else
    echo "User not found!"
fi