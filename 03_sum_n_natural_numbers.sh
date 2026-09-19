#!/bin/bash

# Practical 3: Calculate the sum of the first n natural numbers.

echo "Enter n:"
read -r n

if [ "$n" -lt 1 ]; then
    echo "Please enter a positive integer."
    exit 1
fi

sum=$((n * (n + 1) / 2))
echo "Sum of first $n natural numbers is: $sum"
