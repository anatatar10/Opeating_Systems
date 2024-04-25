#!/bin/bash

while true; do
    # 'who' command to get a list of logged-in users, and 'awk' to extract the first field (username)
    users=$(who | awk '{print $1}')
    active_connections=false

    for user in $users; do
	# Use 'ps -u' to list processes for the current user
	# 'wc -l' to count these processes
        process_count=$(ps -u $user | wc -l)

        # Check if the process count is greater than 0
        if [[ $process_count -gt 0 ]]; then
            active_connections=true 
            echo "User: $user, Process Count: $process_count"
        fi
    done

    # Print a message if no active connections were found
    if [[ $active_connections == false ]]; then
        echo "No active connections found."
    fi

done
