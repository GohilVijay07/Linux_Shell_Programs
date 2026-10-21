#!/bin/bash

echo "Enter directory path:"
read dir

if [ ! -d "$dir" ]; then
    echo "Directory not found!"
    exit
fi

backup="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

tar -czf "$backup" "$dir"

echo "Backup created successfully!"
echo "Backup file: $backup"