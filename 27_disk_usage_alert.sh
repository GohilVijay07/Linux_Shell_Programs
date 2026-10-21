#!/bin/bash

echo "Enter disk usage limit (%):"
read limit

usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

echo "Current Disk Usage: $usage%"

if [ "$usage" -ge "$limit" ]
then
    echo "WARNING! Disk usage is high."
else
    echo "Disk usage is normal."
fi