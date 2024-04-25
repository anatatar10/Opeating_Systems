#!/bin/bash

# Handle the case when no existing file is entered
if [ "$#" -eq 0 ]; then
    echo "Please enter at least one existing file name"
    exit 1
fi

# Iterate through each file provided as argument
for file in "$@"; do
    # Check if file exists
    if [ ! -f "$file" ]; then
        echo "$file does not exist."
        continue
    fi

    # Display lines that don't contain any letter or digit
    # -v inverts the searched pattern, so that I can find lines only with non alphanumeric characters.
    echo "Lines in $file that don't contain any letter or digit:"
    grep -v '[[:alnum:]]' "$file"
done
