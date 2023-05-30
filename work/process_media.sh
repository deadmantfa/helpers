#!/bin/bash

# Function to display help message
function display_help {
    echo "Usage: $0 [MediaFolder] [Google Drive Folder ID]"
    echo
    echo "This script processes media files in a directory and uploads the output to Google Drive."
    echo
    echo "Arguments:"
    echo "  MediaFolder            The name of the main directory containing the media files."
    echo "  Google Drive Folder ID (optional) The ID of the Google Drive folder where the output will be uploaded. If not provided, the output will be uploaded to the root of Google Drive."
    exit 1
}

# Check if help argument is provided
if [[ $1 == "-h" || $1 == "--help" ]]; then
    display_help
fi

# Check if ffmpeg and gdrive are installed
for cmd in ffmpeg gdrive; do
    if ! command -v $cmd &> /dev/null; then
        echo "$cmd could not be found. Please install it and try again."
        exit 1
    fi
done

# The main directory
main_dir=$1
drive_folder_id=$2

# Output directory
output_dir="output/$main_dir"

# Check if directory exists
if [ ! -d "$main_dir" ]; then
    echo "Directory $main_dir does not exist."
    exit 1
fi

# Iterate over each subdirectory in the main directory
for chapter_dir in "$main_dir"/*; do
    if [ -d "$chapter_dir" ]; then
        # Iterate over each content directory in the chapter directory
        for content_dir in "$chapter_dir"/*; do
            if [ -d "$content_dir" ]; then
                # Find the .mp4 and .mp3 files
                video_file=$(find "$content_dir" -type f -name "*.mp4")
                audio_file=$(find "$content_dir" -type f -name "*.mp3")

                # Check if both files exist
                if [ -f "$video_file" ] && [ -f "$audio_file" ]; then
                    # Create the output directory for this content, maintaining the structure
                    output_content_dir="${output_dir}/${chapter_dir##*/}/${content_dir##*/}"
                    mkdir -p "$output_content_dir"

                    # Create the output file name, replacing spaces with underscores
                    output_file="${output_content_dir}/$(basename "$content_dir" | tr ' ' '_')_Final.mp4"

                    # Run the ffmpeg command
                    ffmpeg -hwaccel cuda -i "$video_file" -i "$audio_file" -map 0 -map 1 -c copy -metadata:s:a:0 title='Track 1' -metadata:s:a:1 title='Track 2' -metadata:s:a:0 language=hin -metadata:s:a:1 language=eng -strict -2 "$output_file"
                else
                    echo "Video or audio file not found in $content_dir"
                fi
            fi
        done
    fi
done

# Check if drive_folder_id is provided
if [ -z "$drive_folder_id" ]; then
    # Upload the entire output directory to Google Drive root
    gdrive upload --recursive "$output_dir"
else
    # Upload the entire output directory to the specified Google Drive folder
    gdrive upload --parent "$drive_folder_id" --recursive "$output_dir"
fi
