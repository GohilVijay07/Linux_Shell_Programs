#!/bin/bash

echo "========== User Management =========="
echo "1. Add User"
echo "2. Delete User"
echo "3. Modify Username"
echo "4. Change Password"
echo "5. Lock User"
echo "6. Unlock User"
echo "7. Display User Information"
echo "8. Display User Groups"
echo "9. Display All Users"
echo "10. Check User Exists"
echo "11. Display Logged-in Users"
echo "12. Change Login Shell"
echo "13. Change Home Directory"
echo "14. Set Account Expiration"
echo "15. Display Account Aging"
echo "16. Delete User with Home Directory"
echo "17. Exit"
echo "===================================="

while true
do
    read -p "Enter your choice: " ch

    case $ch in

    1)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            echo "User already exists!"
        else
            sudo useradd -m "$username"

            if [ $? -eq 0 ]
            then
                echo "User added successfully!"
            else
                echo "User add failed!"
            fi
        fi
        ;;

    2)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            read -p "Delete this user? (y/n): " confirm

            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]
            then
                sudo userdel "$username"

                if [ $? -eq 0 ]
                then
                    echo "User deleted successfully!"
                else
                    echo "User delete failed!"
                fi
            else
                echo "Delete cancelled."
            fi
        else
            echo "User not found!"
        fi
        ;;

    3)
        read -p "Enter old username: " oldName
        read -p "Enter new username: " newName

        if id "$oldName" &>/dev/null
        then
            sudo usermod -l "$newName" "$oldName"

            if [ $? -eq 0 ]
            then
                echo "Username changed successfully!"
            else
                echo "Username change failed!"
            fi
        else
            echo "User not found!"
        fi
        ;;

    4)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            sudo passwd "$username"
        else
            echo "User not found!"
        fi
        ;;

    5)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            sudo usermod -L "$username"
            echo "User account locked!"
        else
            echo "User not found!"
        fi
        ;;

    6)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            sudo usermod -U "$username"
            echo "User account unlocked!"
        else
            echo "User not found!"
        fi
        ;;

    7)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            id "$username"
            getent passwd "$username"
        else
            echo "User not found!"
        fi
        ;;

    8)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            echo "User Groups:"
            id -nG "$username"
        else
            echo "User not found!"
        fi
        ;;

    9)
        echo "All System Users:"
        cut -d: -f1 /etc/passwd
        ;;

    10)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            echo "User exists!"
        else
            echo "User does not exist!"
        fi
        ;;

    11)
        echo "Currently Logged-in Users:"
        who
        ;;

    12)
        read -p "Enter username: " username
        read -p "Enter login shell: " shell

        if id "$username" &>/dev/null
        then
            sudo usermod -s "$shell" "$username"
            echo "Login shell changed successfully!"
        else
            echo "User not found!"
        fi
        ;;

    13)
        read -p "Enter username: " username
        read -p "Enter new home directory: " home

        if id "$username" &>/dev/null
        then
            sudo usermod -d "$home" -m "$username"
            echo "Home directory changed successfully!"
        else
            echo "User not found!"
        fi
        ;;

    14)
        read -p "Enter username: " username
        read -p "Enter expiration date (YYYY-MM-DD): " date

        if id "$username" &>/dev/null
        then
            sudo chage -E "$date" "$username"
            echo "Expiration date set successfully!"
        else
            echo "User not found!"
        fi
        ;;

    15)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            sudo chage -l "$username"
        else
            echo "User not found!"
        fi
        ;;

    16)
        read -p "Enter username: " username

        if id "$username" &>/dev/null
        then
            read -p "Delete user and home directory? (y/n): " confirm

            if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]
            then
                sudo userdel -r "$username"

                if [ $? -eq 0 ]
                then
                    echo "User and home directory deleted!"
                else
                    echo "Delete failed!"
                fi
            else
                echo "Delete cancelled."
            fi
        else
            echo "User not found!"
        fi
        ;;

    17)
        echo "Exiting..."
        exit 0
        ;;

    *)
        echo "Invalid choice!"
        ;;

    esac
done