#!/bin/bash

# --- Video Conversion Script ---
# Converts a .mov file to a smaller .mp4 file using ffmpeg.

# 1. Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null
then
    echo "Error: ffmpeg is not installed."
    echo "Please install it to run this script."
    echo "On macOS (with Homebrew): brew install ffmpeg"
    echo "On Debian/Ubuntu: sudo apt-get install ffmpeg"
    exit 1
fi

# 2. Prompt the user for the input file
read -p "Enter the path to your input .mov file: " input_file

# 3. Validate the input
if [ -z "$input_file" ]; then
    echo "Error: No input file provided. Exiting."
    exit 1
fi

if [ ! -f "$input_file" ]; then
    echo "Error: File not found at '$input_file'"
    exit 1
fi

# 4. Generate the output filename
# This takes the input filename and replaces its extension with .mp4
output_file="${input_file%.*}.mp4"

echo "" # Add a newline for better readability
echo "----------------------------------------"
echo "Input file:  $input_file"
echo "Output file: $output_file"
echo "----------------------------------------"
echo "Starting conversion... This may take a moment."
echo ""

# 5. Run the ffmpeg command
ffmpeg -i "$input_file" -c:v libx264 -crf 23 -c:a aac -b:a 128k "$output_file"

# 6. Check the result and provide feedback
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Conversion successful!"
    echo "Your new file is saved at: $output_file"
else
    echo ""
    echo "❌ An error occurred during conversion."
fi

