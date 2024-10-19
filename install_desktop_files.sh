#!/bin/bash

# Directory containing the .desktop files
DESKTOP_DIR="$1"

# Check if the directory is provided
if [ -z "$DESKTOP_DIR" ]; then
    echo "Usage: $0 <directory-containing-desktop-files>"
    exit 1
fi

# Validate and install each .desktop file in the directory
for desktop_file in "$DESKTOP_DIR"/*.desktop; do
    if [ -f "$desktop_file" ]; then
        echo "Processing $desktop_file..."

        # Validate the .desktop file
        if desktop-file-validate "$desktop_file"; then
            echo "Validation successful: $desktop_file"

            # Install the .desktop file
            desktop-file-install "$desktop_file"
            echo "Installed: $desktop_file"
        else
            echo "Validation failed: $desktop_file"
        fi
    else
        echo "No .desktop files found in $DESKTOP_DIR"
    fi
done
