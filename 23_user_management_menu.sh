#!/bin/bash

# Practical 23: Menu-driven Bash script for common Linux user management operations.
# Subject: Linux System Administration (MSC IT Sem-1)
# College: Department of Computer Science, Faculty of ICT, Gujarat Vidyapith

# Requirement 1: Check root/sudo privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo or as root."
    echo "Example: sudo ./23_user_management_menu.sh"
    exit 1
fi

# Function to validate whether a user exists
user_exists() {
    id "$1" > /dev/null 2>&1
}

# Infinite loop to keep showing menu until user chooses Exit (17)
while true; do
    echo "=========================================="
    echo "        LINUX USER MANAGEMENT MENU        "
    echo "=========================================="
    echo "1.  Create a new user"
    echo "2.  Delete an existing user"
    echo "3.  Modify user information"
    echo "4.  Set or change user password"
    echo "5.  Lock a user account"
    echo "6.  Unlock a user account"
    echo "7.  Display user information"
    echo "8.  Display the groups to which a user belongs"
    echo "9.  Display all system users"
    echo "10. Check whether a user exists"
    echo "11. Display currently logged-in users"
    echo "12. Change a user's login shell"
    echo "13. Change a user's home directory"
    echo "14. Set account expiration date"
    echo "15. Display account aging information"
    echo "16. Remove a user along with their home directory"
    echo "17. Exit"
    echo "=========================================="
    read -p "Enter your choice [1-17]: " choice

    case "$choice" in
        1)
            # Create a new user
            read -p "Enter username to create: " user
            if user_exists "$user"; then
                echo "User '$user' already exists!"
            else
                useradd "$user"
                echo "User '$user' created successfully."
            fi
            ;;

        2)
            # Delete an existing user (with confirmation)
            read -p "Enter username to delete: " user
            if user_exists "$user"; then
                read -p "Are you sure you want to delete '$user'? (y/n): " confirm
                if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                    userdel "$user"
                    echo "User '$user' deleted successfully."
                else
                    echo "Deletion cancelled."
                fi
            else
                echo "User '$user' does not exist."
            fi
            ;;

        3)
            # Modify user information (Full name / comment)
            read -p "Enter username: " user
            if user_exists "$user"; then
                read -p "Enter new comment/full name: " comment
                usermod -c "$comment" "$user"
                echo "User information updated successfully."
            else
                echo "User '$user' does not exist."
            fi
            ;;

        4)
            # Set or change user password
            read -p "Enter username: " user
            if user_exists "$user"; then
                passwd "$user"
            else
                echo "User '$user' does not exist."
            fi
            ;;

        5)
            # Lock a user account
            read -p "Enter username to lock: " user
            if user_exists "$user"; then
                passwd -l "$user"
                echo "User account '$user' locked successfully."
            else
                echo "User '$user' does not exist."
            fi
            ;;

        6)
            # Unlock a user account
            read -p "Enter username to unlock: " user
            if user_exists "$user"; then
                passwd -u "$user"
                echo "User account '$user' unlocked successfully."
            else
                echo "User '$user' does not exist."
            fi
            ;;

        7)
            # Display user information (id and getent)
            read -p "Enter username: " user
            if user_exists "$user"; then
                echo "--- User and Group IDs ---"
                id "$user"
                echo "--- Password Entry (/etc/passwd) ---"
                getent passwd "$user"
            else
                echo "User '$user' does not exist."
            fi
            ;;

        8)
            # Display groups to which a user belongs
            read -p "Enter username: " user
            if user_exists "$user"; then
                groups "$user"
            else
                echo "User '$user' does not exist."
            fi
            ;;

        9)
            # Display all system users
            echo "--- List of All System Users ---"
            cut -d: -f1 /etc/passwd
            ;;

        10)
            # Check whether a user exists
            read -p "Enter username to check: " user
            if user_exists "$user"; then
                echo "Yes, user '$user' exists."
            else
                echo "No, user '$user' does not exist."
            fi
            ;;

        11)
            # Display currently logged-in users
            echo "--- Currently Logged-in Users ---"
            who
            ;;

        12)
            # Change a user's login shell
            read -p "Enter username: " user
            if user_exists "$user"; then
                read -p "Enter new shell (e.g., /bin/bash): " shell
                usermod -s "$shell" "$user"
                echo "Login shell changed to '$shell'."
            else
                echo "User '$user' does not exist."
            fi
            ;;

        13)
            # Change a user's home directory
            read -p "Enter username: " user
            if user_exists "$user"; then
                read -p "Enter new home directory path: " newdir
                usermod -d "$newdir" -m "$user"
                echo "Home directory changed to '$newdir'."
            else
                echo "User '$user' does not exist."
            fi
            ;;

        14)
            # Set account expiration date
            read -p "Enter username: " user
            if user_exists "$user"; then
                read -p "Enter expiration date (YYYY-MM-DD): " expdate
                chage -E "$expdate" "$user"
                echo "Account expiration date set to '$expdate'."
            else
                echo "User '$user' does not exist."
            fi
            ;;

        15)
            # Display account aging information
            read -p "Enter username: " user
            if user_exists "$user"; then
                chage -l "$user"
            else
                echo "User '$user' does not exist."
            fi
            ;;

        16)
            # Remove a user along with their home directory (with confirmation)
            read -p "Enter username to remove: " user
            if user_exists "$user"; then
                read -p "Are you sure you want to remove '$user' AND home directory? (y/n): " confirm
                if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
                    userdel -r "$user"
                    echo "User '$user' and home directory removed successfully."
                else
                    echo "Removal cancelled."
                fi
            else
                echo "User '$user' does not exist."
            fi
            ;;

        17)
            # Exit the script
            echo "Exiting program. Goodbye!"
            exit 0
            ;;

        *)
            # Handle invalid choice
            echo "Invalid choice! Please enter a number between 1 and 17."
            ;;
    esac
    echo
done