#!/bin/bash

newusers="subscriber.csv"

# Read the file line by line
while read -r line; do
    heading=$(echo "$line" | grep "Firstname, Lastname, Username, Password")
    if [[ $heading ]]; 
    then
        echo "Found header line: $line"
    else
        firstname=$(echo "$line" | cut -d"," -f1)
        lastname=$(echo "$line" | cut -d"," -f2)
        username=$(echo "$line" | cut -d"," -f3)
        password=$(echo "$line" | cut -d"," -f4)

        # Check if the user already exists
        if id "$username" &>/dev/null; 
        then
            echo "User $username already exists."
        else
            # Create account for the users
            sudo useradd "$username"
            echo "$username:$password" | sudo chpasswd

            echo -e "Subject: Welcome to the PlatformCloud Engineer\n\nYou are welcome to the platform!" | ssmtp oyinloyedavidkay@gmail.com

            echo "User $username created."
        fi
    fi
done < "$newusers"
