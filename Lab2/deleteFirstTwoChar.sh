#!/bin/bash

# Handle the case when no file is provided
if [ $# -eq 0 ]; then
    echo "Please enter at least one file."
    exit 1
fi

# Iterate through each file provided as argument
for file in "$@"; do
    # Check if the file exists
    if [ ! -f "$file" ]; then
        echo "$file does not exist."
        continue
    fi

    # Use sed to delete the first 2 characters on each line
    # .bak creates a backup of the original file before modifying it
    # ^ - start of line, . - any single char, \{2\} - 2 time any sg char
    # // - replace with nothing (delete)
    sed -i.bak 's/^.\{2\}//' "$file"
    echo "Deleted first 2 characters in $file"
done

