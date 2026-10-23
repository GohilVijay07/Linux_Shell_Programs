#!/bin/bash

while true
do
    echo "===== FILE SEARCH MENU ====="
    echo "1. Find by filename"
    echo "2. Find by extension"
    echo "3. Find by file size"
    echo "4. Find by owner"
    echo "5. Find by permissions"
    echo "6. Find files modified in last N days"
    echo "7. Find files not modified in last N days"
    echo "8. Find files modified between dates"
    echo "9. Find files by multiple criteria"
    echo "10. Count matching files"
    echo "11. Exit"

    read -p "Enter your choice: " ch
    read -p "Enter directory path: " dir

    if [ ! -d "$dir" ] && [ "$ch" != "11" ]; then
        echo "Directory not found!"
        continue
    fi

    case $ch in
        1)
            read -p "Enter filename: " name
            find "$dir" -type f -name "$name"
            ;;
        2)
            read -p "Enter extension (e.g. txt): " ext
            find "$dir" -type f -name "*.$ext"
            ;;
        3)
            read -p "Enter minimum size (e.g. 1M): " size
            find "$dir" -type f -size +"$size"
            ;;
        4)
            read -p "Enter owner username: " owner
            find "$dir" -type f -user "$owner"
            ;;
        5)
            read -p "Enter permissions (e.g. 644): " perm
            find "$dir" -type f -perm "$perm"
            ;;
        6)
            read -p "Enter number of days: " days
            find "$dir" -type f -mtime -"$days"
            ;;
        7)
            read -p "Enter number of days: " days
            find "$dir" -type f -mtime +"$days"
            ;;
        8)
            read -p "Enter start date (YYYY-MM-DD): " start
            read -p "Enter end date (YYYY-MM-DD): " end
            find "$dir" -type f -newermt "$start" ! -newermt "$end 23:59:59"
            ;;
        9)
            read -p "Enter filename pattern: " name
            read -p "Enter minimum size (e.g. 1k): " size
            find "$dir" -type f -name "$name" -size +"$size"
            ;;
        10)
            read -p "Enter filename pattern (* for all): " name
            find "$dir" -type f -name "$name" | wc -l
            ;;
        11)
            echo "Exiting..."
            exit
            ;;
        *)
            echo "Invalid choice!"
            ;;
    esac
done