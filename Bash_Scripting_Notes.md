# Bash Scripting Notes

A comprehensive guide based on your notes, covering the fundamentals of Bash scripting from basic commands to project examples.

---

## 1. Core Concepts

### Kernel vs. Operating System

* The **Kernel** is the core of an Operating System (OS). It acts as a bridge between the computer's hardware and the software running on it. Think of it as the **engine** of a car.
* The **Operating System** is the complete set of programs that manages all computer resources and provides an interface for the user to interact with the computer. This is the entire **car**, including the engine, wheels, seats, and dashboard.

| Operating System (OS)                                            | Kernel                                                                                                 |
| :--------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------- |
| Manages all hardware & software resources.                       | The core part of the OS that manages system resources (CPU, memory, devices).                          |
| Provides a user interface.                                       | Acts as a bridge between hardware and software.                                                        |
| Handles high-level tasks like managing applications and user I/O.| Handles low-level tasks like process management, memory management, and file system access.            |
| *Examples:* Windows, macOS, Linux distributions (like Ubuntu).   | *Examples:* Linux Kernel, Windows NT Kernel.                                                           |

### The Linux Shell

A shell is a command-line interface that allows you to interact with the kernel by executing commands. It sits between the user/applications and the kernel.

**Architecture:** Hardware -> Kernel -> Shell -> Applications

**Common Shell Types:**
* **sh** (Bourne Shell)
* **bash** (Bourne Again Shell)
* **ksh** (Korn Shell)
* **zsh** (Z Shell)
* **fish** (Friendly Interactive Shell)
* **tcsh**

> While most shells use common Linux commands, their scripting syntax and prompt symbols can differ. For example, `bash` often uses a dollar sign (`$`), while `zsh` might use a percent sign (`%`).

### Shell Scripting

A shell script is a file containing a sequence of commands that are executed sequentially to perform a task. It's used to automate tasks like file manipulation, program execution, and system administration.

---

## 2. Getting Started with Scripts

### The Shebang (`#!`)

A shebang is the first line in a script, which tells the system what interpreter to use to execute the script. For Bash scripts, this is typically:
```

### How to Run a Script

1. **Make the script executable:**
    ```bash
    chmod +x your_script_name.sh
    ```
2. **Execute it:**
    ```bash
    ./your_script_name.sh
    ```
3. **Or run it with the interpreter directly:**
    ```bash
    bash your_script_name.sh
    ```
bash
#!/bin/bash
```
Execute it:

Bash

./your_script_name.sh
Alternatively, you can run it directly with the interpreter:

Bash

bash your_script_name.sh
Comments
Single-line comment: Starts with a #.

Multi-line comment: Enclosed between <<COMMENT and COMMENT.

Bash

# This is a single-line comment.

<<COMMENT
This is a
multi-line comment.
COMMENT
## Variables and Data Types
### Variables
### Variables store data. There are no spaces around the equals sign (=) during assignment. To access the value of a variable, prefix its name with a dollar sign ($).

Bash

# Assignment
my_variable="Hello, World!"

# Accessing the value
echo $my_variable
A read-only variable cannot have its value changed once set.

Bash

readonly my_variable
### Arrays
### Arrays hold multiple values. Values are separated by spaces.

Bash

# Declare an array
my_array=(1 "Hello" "Hey buddy")

# Access a specific element (indexing starts at 0)
echo "The third element is: ${my_Array[2]}"

# Print all elements
echo "All elements: ${my_Array[@]}"

# Get the length of the array
echo "Array length: ${#my_Array[@]}"

# Print a range of values (from index 2, 2 elements)
echo "${my_Array[@]:2:2}"

# Add new elements to the array
my_Array+=("new" 30 40)
### Associative Arrays (Key-Value)
These arrays use strings as keys. You must declare them with declare -A.

Bash

declare -A user
user=([name]="Paul" [age]=20)

# Access value by key
echo "User's name is: ${user[name]}"
### String Operations
Bash

my_var="hey buddy, how are you doing?"

# Get string length
echo "Length is: ${#my_var}"

# Uppercase
echo "Uppercase: ${my_var^^}"

# Lowercase
echo "Lowercase: ${my_var,,}"

# Replace a substring
echo "${my_var/you/we}"
## User Interaction & Operations
### Taking User Input
Use the read command to get input from the user. The -p flag allows you to show a prompt.

Bash

read -p "Enter your name: " user_name
echo "Your name is $user_name"
### Arithmetic Operations
Use let or double parentheses ((...)).

Bash

x=10
y=2

# Using let
let result=$x*$y
echo "Product is: $result"

# Using double parentheses
result_add=$(($x + $y))
echo "Sum is: $result_add"

result_sub=$(($x - $y))
echo "Difference is: $result_sub"
## Control Flow
### Conditional Statements (if, elif, else)
Conditional statements execute code based on whether a condition is true. Note the crucial spaces inside the square brackets [ ].

Comparison Operators:

Operator	Description
-eq	Equal to (for numbers)
-ne	Not equal to
-gt	Greater than
-ge	Greater than or equal to
-lt	Less than
-le	Less than or equal to
==	Equal to (for strings)
!=	Not equal to (for strings)

Export to Sheets
Example:

Bash

read -p "Enter your marks: " marks

if [ "$marks" -ge 80 ]; then
    echo "First Division"
elif [ "$marks" -ge 60 ]; then
    echo "Second Division"
else
    echo "Fail"
fi
### Logical Operators (&&, ||)
Use double brackets [[ ... ]] for more advanced logical operations.

Bash

read -p "What is your age? " age
read -p "What is your country? " country

if [[ "$age" -ge 18 && "$country" == "India" ]]; then
    echo "You can vote."
else
    echo "You can't vote."
fi
### Case Statement
A case statement simplifies complex if-elif-else chains when checking a variable against multiple values.

Bash

echo "a for current date"
echo "b for list of scripts"
echo "c for current directory"
read -p "Enter your choice: " choice

case $choice in
    a)
        echo "Today's date is:"
        date
        ;;
    b)
        echo "List of scripts:"
        ls *.sh
        ;;
    c)
        echo "Current directory:"
        pwd
        ;;
    *) # Default case
        echo "Please provide a valid value (a, b, or c)."
        ;;
esac
### for Loop
Iterates over a list of items.

Bash

# Looping through a sequence of numbers
for i in {1..5}; do
    echo "Number is $i"
done

# C-style for loop
for (( i=0; i<5; i++ )); do
    echo "C-style loop number is $i"
done

# Looping through array elements
my_array=("apple" "banana" "cherry")
for item in "${my_array[@]}"; do
    echo "Fruit: $item"
done
### while Loop
Executes as long as a condition is true.

Bash

count=0
while [ $count -lt 5 ]; do
    echo "Count is $count"
    let count++
done
### until Loop
Executes as long as a condition is false (opposite of while).

Bash

num=10
until [ $num -eq 0 ]; do
    echo "Value of num is $num"
    let num--
done
## Advanced Scripting
### Reading Files
You can read a file line-by-line using a while loop.

Bash

# Read a simple text file
while read my_line; do
  echo "$my_line"
done < my_file.txt

# Read a CSV file by setting the Internal Field Separator (IFS)
while IFS="," read id name age; do
    echo "ID: $id, Name: $name, Age: $age"
done < my_data.csv
### Functions
### Functions group reusable blocks of code.

Bash

# Defining a function
function greet_user() {
    # $1 is the first argument, $2 is the second, and so on
    echo "Hello, $1! You are $2 years old."
}

# Calling the function with arguments
greet_user "Harshil" 20
greet_user "Vraj" 30
### Script Arguments
Your script can accept command-line arguments.

$1, $2, ... : The arguments themselves.

$0: The name of the script.

$#: The number of arguments passed.

$@: All arguments as individual strings.

Bash

# Script name: my_script.sh
# Run as: ./my_script.sh user_a "some description"

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <username> [comment]"
    exit 1
fi

USER_NAME=$1
shift # Moves all arguments to the left
COMMENT=$@

echo "Username: $USER_NAME"
echo "Comment: $COMMENT"
### Loop & Script Control
break: Exits the current loop completely.

continue: Skips the current iteration and proceeds to the next one.

sleep 2: Pauses the script for 2 seconds.

exit 1: Terminates the script with an exit status code of 1 (indicating an error).

### Exit Status ($?)
The $? variable holds the exit status of the previously executed command.

0 means success.

Any non-zero value means an error occurred.

Bash

ping -c 1 google.com
if [ "$?" -eq 0 ]; then
    echo "Site is reachable!"
else
    echo "Error: Site is unreachable."
fi
### File and Directory Checks
Bash

FILE_PATH="/path/to/your/file.txt"
DIR_PATH="/path/to/your/directory"

# Check if file exists
if [ -f "$FILE_PATH" ]; then
    echo "File exists."
fi

# Check if directory exists
if [ -d "$DIR_PATH" ]; then
    echo "Directory exists."
fi
### Output Redirection
>: Redirects output to a file, overwriting the file if it exists.

>>: Appends output to a file.

/dev/null: A special file that discards any data written to it.

Bash

# Overwrite file with ls output
ls -l > file_list.txt

# Append date to the file
date >> file_list.txt

# Run a command but discard its output
ping -c 1 google.com > /dev/null
### Debugging Scripts
set -x: Prints each command before it is executed.

set -e: Exits the script immediately if any command fails.

set -o pipefail: Causes a pipeline to return the exit status of the last command to exit with a non-zero status.

Place these at the top of your script to enable them.

## Scripting Projects
### Project 1: Monitor Free Disk Space
This script checks the disk usage of a partition and sends a warning if it exceeds a threshold.

Bash

#!/bin/bash

# Get usage percentage for the root filesystem, removing the '%' sign
FU=$(df -H | grep ' /$' | awk '{print $5}' | tr -d '%')
TO="your-email@example.com"

if [ $FU -ge 80 ]; then
    echo "Warning, disk space is low: $FU%" | mail -s "Disk Space Alert" $TO
else
    echo "All good."
fi
### Project 2: Archive Old/Large Files
This script finds files larger than a specified size and moves them to an archive folder.

Bash

#!/bin/bash

BASE="/path/to/your/directory"
ARCHIVE_DIR="$BASE/archive"

# Check if the base directory exists
if [ ! -d "$BASE" ]; then
    echo "Error: Directory $BASE does not exist."
    exit 1
fi

# Create archive folder if it doesn't exist
if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir "$ARCHIVE_DIR"
fi

# Find files larger than 20MB and compress them into the archive directory
find "$BASE" -type f -size +20M -exec gzip -c {} > "$ARCHIVE_DIR/{}.gz" \;

echo "Archiving complete."
### Project 3: Create a New Local User
This script automates the creation of a new user with a randomly generated password.

Bash

#!/bin/bash

# Must be run with root privileges
if [[ "$UID" -ne 0 ]]; then
    echo "Please run this script with root privileges."
    exit 1
fi

# Check for at least one argument (the username)
if [[ "$#" -lt 1 ]]; then
    echo "Usage: $0 USER_NAME [COMMENT...]"
    exit 1
fi

# The first argument is the username
USER_NAME="${1}"

# The rest of the arguments are the comment
shift
COMMENT="${@}"

# Generate a random password
PASSWORD=$(date +%s%N | sha256sum | head -c12)

# Create the user with the comment and home directory
useradd -c "${COMMENT}" -m "${USER_NAME}"

# Check if the user was created successfully
if [[ "$?" -ne 0 ]]; then
    echo "The account could not be created."
    exit 1
fi

# Set the password for the new user
echo "${USER_NAME}:${PASSWORD}" | chpasswd
if [[ "$?" -ne 0 ]]; then
    echo "The password could not be set."
    exit 1
fi

# Force password change on first login
passwd -e "${USER_NAME}"

# Display the new user's credentials
echo
echo "User created successfully!"
echo "Username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "Host: $(hostname)"
✨ Additional Notes & Best Practices
Here is some extra information that builds upon your notes and aligns with modern scripting practices.

### The Importance of Quoting
In Bash, how you quote strings is critical.

Double Quotes ("..."): Use these most of the time. They prevent word splitting and preserve literal values of most characters, but still allow for variable expansion ($var) and command substitution ($(cmd)). This is the safest and most common choice.

Bash

name="World"
echo "Hello, $name" # Output: Hello, World
Single Quotes ('...'): Preserve the literal value of every character inside. Nothing is expanded. Use this when you want to ensure the text is treated exactly as written.

Bash

name="World"
echo 'Hello, $name' # Output: Hello, $name
No Quotes: Avoid using variables without quotes. It can lead to unexpected behavior due to word splitting and globbing (filename expansion).

Bash

my_file="File with spaces.txt"
touch $my_file # This will create TWO files: "File", "with", and "spaces.txt"
touch "$my_file" # This correctly creates ONE file: "File with spaces.txt"
### Command Substitution
Your notes use $(hostname). This is called command substitution. It allows you to use the output of a command as part of another command or as a value for a variable. The $(...) syntax is modern and preferred because it can be nested easily. The older syntax using backticks (`) is still seen but is less readable and harder to nest.

Bash

# Preferred modern syntax
current_date=$(date +"%Y-%m-%d")
echo "Today's date is $current_date"

# Old syntax (avoid if possible)
current_date=`date +"%Y-%m-%d"`
### Parameter Expansion
You used ${#my_Array[@]} to get array length. Parameter expansion can do much more.

Provide a default value: ${variable:-default}

Bash

# Use "guest" if USERNAME is not set
echo "Welcome, ${USERNAME:-guest}"
Find and Replace: You used ${var/find/replace}. To replace all occurrences, use a double slash: ${var//find/replace}.

Bash

sentence="the quick brown fox jumps over the lazy dog"
echo "${sentence//the/a}" # Output: a quick brown fox jumps over a lazy dog
### Scheduling with cron
While at is great for one-time tasks, cron is the standard for scheduling recurring scripts. Use crontab -e to edit your cron jobs. The format is:

MINUTE HOUR DAY_OF_MONTH MONTH DAY_OF_WEEK /path/to/your/script.sh
* means "every".

Example: Run a backup script every day at 2:30 AM.

30 2 * * * /home/user/scripts/backup.sh


### Project 4: Automated Backup System
Backs up critical directories into compressed archives, keeps only the latest 5 backups.

```bash
#!/bin/bash

SOURCE_DIR="/home/user/documents"
BACKUP_DIR="/home/user/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/documents_backup_$TIMESTAMP.tar.gz"

# Create backup
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Remove old backups (keep last 5)
cd "$BACKUP_DIR" || exit
ls -tp | grep 'documents_backup_' | tail -n +6 | xargs -I {} rm -- {}

echo "Backup completed: $BACKUP_FILE"
```

### Project 5: System Resource Monitor (with Logs)
Logs CPU and memory usage every minute, alerts if usage crosses a threshold.

```bash
#!/bin/bash

LOG_FILE="/var/log/sys_monitor.log"
CPU_THRESHOLD=80
MEM_THRESHOLD=80

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM_USAGE=$(free | grep Mem | awk '{printf("%.2f", $3/$2 * 100)}')

echo "$(date): CPU: $CPU_USAGE%, Memory: $MEM_USAGE%" >> "$LOG_FILE"

if (( ${CPU_USAGE%.*} > CPU_THRESHOLD )); then
    echo "High CPU Usage Alert: $CPU_USAGE%" | mail -s "CPU Alert" your-email@example.com
fi

if (( ${MEM_USAGE%.*} > MEM_THRESHOLD )); then
    echo "High Memory Usage Alert: $MEM_USAGE%" | mail -s "Memory Alert" your-email@example.com
fi
```

---
---

## 5. Advanced Projects

### Project 4: Schedule Automated Tasks with Cron
This script backs up a folder and is meant to be run daily using `cron`.

```bash
#!/bin/bash

SOURCE_DIR="/home/user/documents"
DEST_DIR="/home/user/backups"
FILENAME="backup_$(date +%Y%m%d).tar.gz"

mkdir -p "$DEST_DIR"
tar -czf "$DEST_DIR/$FILENAME" "$SOURCE_DIR"
echo "Backup created at $DEST_DIR/$FILENAME"
```

**Cron Setup:**
Edit your crontab with:
```bash
crontab -e
```
And add:
```
0 2 * * * /home/user/scripts/backup.sh
```

---

### Project 5: Check System Service Status Report
Check status of essential system services and generate a report.

```bash
#!/bin/bash

SERVICES=("ssh" "cron" "nginx" "mysql")
REPORT="/tmp/service_status_$(date +%F).log"

for service in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "$service is running" >> "$REPORT"
    else
        echo "$service is NOT running" >> "$REPORT"
    fi
done

echo "Status report saved to $REPORT"
```

---

### Project 6: Call a Public API and Parse JSON
Uses `curl` and `jq` to fetch and parse JSON data from a public API.

```bash
#!/bin/bash

echo "Fetching joke from official joke API..."

RESPONSE=$(curl -s https://official-joke-api.appspot.com/random_joke)

SETUP=$(echo "$RESPONSE" | jq -r '.setup')
PUNCHLINE=$(echo "$RESPONSE" | jq -r '.punchline')

echo "Here's a joke for you:"
echo "$SETUP"
sleep 2
echo "$PUNCHLINE"
```

*Note: Make sure `jq` is installed: `sudo apt install jq`*

---

### Project 7: Sync Files Between Directories
Sync files between two directories using `rsync`.

```bash
#!/bin/bash

SOURCE="/home/user/projects"
DEST="/mnt/backup/projects"

rsync -av --delete "$SOURCE/" "$DEST/"

echo "Sync complete from $SOURCE to $DEST"
```

---

### Project 8: Log Rotation Script
Manages large logs by compressing and archiving logs older than 7 days.

```bash
#!/bin/bash

LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="/var/log/myapp/archive"
mkdir -p "$ARCHIVE_DIR"

find "$LOG_DIR" -name "*.log" -type f -mtime +7 -exec gzip {} \; -exec mv {}.gz "$ARCHIVE_DIR" \;

echo "Old logs rotated and archived."
```

---
```