#!/bin/bash

# Practical 5: Display the calendar for a month specified by the user.
# Usage: ./05_display_month_calendar.sh <month> <year>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <month> <year>"
    echo "Example: $0 7 2023"
    exit 1
fi

month=$1
year=$2

if ! [[ "$month" =~ ^[0-9]+$ ]] || [ "$month" -lt 1 ] || [ "$month" -gt 12 ]; then
    echo "Error: Month must be between 1 and 12."
    exit 1
fi

if ! [[ "$year" =~ ^[0-9]+$ ]]; then
    echo "Error: Year must be a number."
    exit 1
fi

cal "$month" "$year"
