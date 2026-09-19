#!/bin/bash

# Practical 4: Bash calculator using separate functions for arithmetic operations.

echo "Enter first number:"
read -r a

echo "Enter second number:"
read -r b

addition() {
    echo "Addition       = $((a + b))"
}

subtraction() {
    echo "Subtraction    = $((a - b))"
}

multiplication() {
    echo "Multiplication = $((a * b))"
}

division() {
    if [ "$b" -eq 0 ]; then
        echo "Division by zero is not allowed."
    else
        echo "Division       = $((a / b))"
    fi
}

modulus() {
    if [ "$b" -eq 0 ]; then
        echo "Modulus by zero is not allowed."
    else
        echo "Modulus        = $((a % b))"
    fi
}

addition
subtraction
multiplication
division
modulus
