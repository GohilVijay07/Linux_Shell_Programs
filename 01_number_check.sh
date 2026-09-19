#!/bin/bash

# Practical 1: Check whether a number is positive, negative, zero, even, or odd.

echo "Enter a number:"
read -r n

if [ "$n" -gt 0 ]; then
    echo "$n is positive"
elif [ "$n" -lt 0 ]; then
    echo "$n is negative"
else
    echo "$n is zero"
fi

if [ $((n % 2)) -eq 0 ]; then
    echo "$n is even"
else
    echo "$n is odd"
fi
