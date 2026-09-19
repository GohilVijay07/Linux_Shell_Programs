#!/bin/bash

# Practical 2: Find the largest among three numbers.

echo "Enter first number:"
read -r a

echo "Enter second number:"
read -r b

echo "Enter third number:"
read -r c

if [ "$a" -ge "$b" ] && [ "$a" -ge "$c" ]; then
    echo "Largest number is: $a"
elif [ "$b" -ge "$a" ] && [ "$b" -ge "$c" ]; then
    echo "Largest number is: $b"
else
    echo "Largest number is: $c"
fi
