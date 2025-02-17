# LinuxUserCreation
Bash script

This Bash script reads a CSV file named "subscriber.csv" line by line and performs the following actions:

1. Check for Header Line: It identifies and skips the header line that contains "Firstname, Lastname, Username, Password".

2. Extract User Information: For each subsequent line, it extracts the firstname, lastname, username, and password from the CSV file.

3. Check User Existence: It checks if the user already exists on the system using the id command.

4. Create User: If the user does not exist, it creates a new user account with the extracted username and sets the password.

5. Send Welcome Email: After creating the user, it sends a welcome email to the specified email address.

The script ensures that existing users are not recreated and provides feedback for each action taken.
