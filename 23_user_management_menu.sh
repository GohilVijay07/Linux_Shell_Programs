#!/bin/bash

# Practical 23: Menu-driven Bash script for common Linux user management.
# Administrative operations require root/sudo privileges.

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo/root privileges."
    exit 1
fi

user_exists() {
    id "$1" &>/dev/null
}

while true; do
    echo
    echo "====== USER MANAGEMENT ======"
    echo "1.  Create User"
    echo "2.  Delete User"
    echo "3.  Modify User Information"
    echo "4.  Set/Change User Password"
    echo "5.  Lock User Account"
    echo "6.  Unlock User Account"
    echo "7.  Display User Information"
    echo "8.  Display User Groups"
    echo "9.  Display All System Users"
    echo "10. Check Whether User Exists"
    echo "11. Display Currently Logged-in Users"
    echo "12. Change User Login Shell"
    echo "13. Change User Home Directory"
    echo "14. Set Account Expiration Date"
    echo "15. Display Account Aging Information"
    echo "16. Remove User + Home Directory"
    echo "17. Exit"
    echo "============================="

    read -r -p "Enter your choice: " choice

    case "$choice" in
        1)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                echo "User already exists."
            else
                useradd "$user" && echo "User created successfully."
            fi
            ;;
        2)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                read -r -p "Are you sure you want to delete '$user'? (y/n): " ans
                if [ "$ans" = "y" ]; then
                    userdel "$user" && echo "User deleted."
                else
                    echo "Delete cancelled."
                fi
            else
                echo "User does not exist."
            fi
            ;;
        3)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                read -r -p "Enter new full name: " name
                usermod -c "$name" "$user" && echo "User information modified."
            else
                echo "User does not exist."
            fi
            ;;
        4)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                passwd "$user"
            else
                echo "User does not exist."
            fi
            ;;
        5)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                passwd -l "$user" && echo "User locked."
            else
                echo "User does not exist."
            fi
            ;;
        6)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                passwd -u "$user" && echo "User unlocked."
            else
                echo "User does not exist."
            fi
            ;;
        7)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                id "$user"
                getent passwd "$user"
            else
                echo "User does not exist."
            fi
            ;;
        8)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                groups "$user"
            else
                echo "User does not exist."
            fi
            ;;
        9)
            echo "All system users:"
            cut -d: -f1 /etc/passwd
            ;;
        10)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                echo "User exists."
            else
                echo "User does not exist."
            fi
            ;;
        11)
            who
            ;;
        12)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                read -r -p "Enter new shell (e.g. /bin/bash): " shell
                usermod -s "$shell" "$user" && echo "Login shell changed."
            else
                echo "User does not exist."
            fi
            ;;
        13)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                read -r -p "Enter new home directory: " home
                usermod -d "$home" -m "$user" && echo "Home directory changed."
            else
                echo "User does not exist."
            fi
            ;;
        14)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                read -r -p "Enter expiry date (YYYY-MM-DD): " date
                chage -E "$date" "$user" && echo "Expiry date set."
            else
                echo "User does not exist."
            fi
            ;;
        15)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                chage -l "$user"
            else
                echo "User does not exist."
            fi
            ;;
        16)
            read -r -p "Enter username: " user
            if user_exists "$user"; then
                read -r -p "Delete '$user' and its home directory? (y/n): " ans
                if [ "$ans" = "y" ]; then
                    userdel -r "$user" && echo "User and home directory deleted."
                else
                    echo "Delete cancelled."
                fi
            else
                echo "User does not exist."
            fi
            ;;
        17)
            echo "Program ended."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1-17."
            ;;
    esac
done
