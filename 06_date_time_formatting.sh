#!/bin/bash

# Practical 6: Display date/time in different formats using Linux date commands.

CURRENT_DATE=$(date)
echo "$CURRENT_DATE"
echo

echo "Date is ...........................: $(date '+%d-%m-%y')"
echo "Date is ...........................: $(date '+%m/%d/%y')"
echo "Time is ...........................: $(date '+%H - %M - %S')"
echo "Time is ...........................: $(date '+%H:%M:%S')"
echo "No. of days elapsed in this year is: $(date '+%j')"
echo "Serial no. of day (of week) is....: $(date '+%u')"
echo "Day and Date is....................: $(date '+%a %b %d, %Y')"
echo "Time in the form AM/PM ............: $(date '+%I:%M:%S %p')"

HOUR=$(date '+%H')

if [ "$HOUR" -ge 5 ] && [ "$HOUR" -lt 12 ]; then
    echo "Good Morning"
elif [ "$HOUR" -ge 12 ] && [ "$HOUR" -lt 17 ]; then
    echo "Good Afternoon"
elif [ "$HOUR" -ge 17 ] && [ "$HOUR" -lt 21 ]; then
    echo "Good Evening"
else
    echo "Good Night"
fi
