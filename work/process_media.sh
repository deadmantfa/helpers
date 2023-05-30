#!/bin/bash

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "ffmpeg could not be found. Please install it and try again."
    exit 1
fi

# The main directory (CourseName)
main_dir=$1

# Output directory
output_dir="$main_dir/output"

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
