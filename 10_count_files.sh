#!/bin/bash

echo "Enter directory:"
read dir

for ext in txt c cpp py sh jpg
do
    count=$(find "$dir" -maxdepth 1 -type f -name "*.$ext" | wc -l)

    echo ".$ext files = $count"
done