#!/bin/bash

today=$(date +%d-%m)

while IFS=: read -r name username birthday
do
    if [ "$birthday" = "$today" ] && who | grep -q "^$username "
    then
        echo "Happy Birthday, $name!"
    fi
done < birthdays.txt