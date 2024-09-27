#!/bin/zsh

# Check if a message was provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <message> <command> [args...]"
    exit 1
fi

# Extract the message and command
MESSAGE="$1"
shift
COMMAND="$@"

# Clear the terminal screen
clear

# Print the message
echo -e "${MESSAGE}"

# Execute the provided command
eval "$COMMAND"
