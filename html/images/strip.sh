#!/bin/bash

# This script renames files by removing the '_resized' suffix from their names.
# It operates on files in the current directory.

echo "Starting to remove '_resized' suffix from filenames in the current directory..."

# Loop through all files in the current directory
for file in *; do
    # Check if the file name contains "_resized"
    if [[ "$file" == *"_resized"* ]]; then
        # Construct the new filename by replacing "_resized" with an empty string
        new_file=$(echo "$file" | sed 's/_resized//g')
        
        # Check if the new filename is different from the original
        if [[ "$file" != "$new_file" ]]; then
            # Rename the file
            mv "$file" "$new_file"
            echo "Renamed '$file' to '$new_file'"
        else
            echo "Skipping '$file': No change needed or already processed."
        fi
    fi
done

echo "Finished processing files."
