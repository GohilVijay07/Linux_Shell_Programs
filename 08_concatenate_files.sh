#Write a shell script which concatenate all given files into a single file. Put filename before every file. e.g. *** filename : xyz ***

#!/bin/bash

echo "Enter output file name:"
read output

> "$output"

for file in "$@"
do
    echo "*** filename : $file ***" >> "$output"
    cat "$file">> "$output"
done

echo "All files concatenated successfully."