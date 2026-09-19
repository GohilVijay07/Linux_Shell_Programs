#!/bin/bash

# Practical 8: Concatenate all given files into a single file.
# A filename header is added before each input file.
# Usage: ./08_concatenate_files.sh output.txt file1 file2 ...

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <output_file> <input_file1> [input_file2 ...]"
    exit 1
fi

output=$1
shift

# Prevent accidentally using an input file as the output file.
for file in "$@"; do
    if [ "$file" = "$output" ]; then
        echo "Error: Output file must be different from input files."
        exit 1
    fi
    if [ ! -f "$file" ]; then
        echo "Error: File not found: $file"
        exit 1
    fi
done

: > "$output"

for file in "$@"; do
    echo "*** filename : $file ***" >> "$output"
    cat "$file" >> "$output"
    echo >> "$output"
done

echo "All files concatenated successfully into: $output"
