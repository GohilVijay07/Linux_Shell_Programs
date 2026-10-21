#!/bin/bash

while true
do
    echo "------------------------"
    echo "1. System Information"
    echo "2. Disk Usage"
    echo "3. Memory Usage"
    echo "4. Logged-in Users"
    echo "5. Running Processes"
    echo "6. Listening Ports"
    echo "7. Failed Services"
    echo "8. Date and Time"
    echo "9. Exit"
    echo "------------------------"

    read -p "Enter your choice: " ch

    case $ch in

    1)
        hostnamectl
        ;;

    2)
        df -h
        ;;

    3)
        free -h
        ;;

    4)
        who
        ;;

    5)
        ps aux
        ;;

    6)
        ss -tuln
        ;;

    7)
        systemctl --failed
        ;;

    8)
        date
        ;;

    9)
        echo "Exiting..."
        exit
        ;;

    *)
        echo "Invalid choice!"
        ;;

    esac
done