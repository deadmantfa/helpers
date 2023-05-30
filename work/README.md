# Process Media
This script is designed to automate the process of merging video and audio files in a directory using ffmpeg. It iterates over each subdirectory in the provided directory, finds the .mp4 and .mp3 files, and then runs the ffmpeg command on them.

## Prerequisites
- Bash
- ffmpeg

If ffmpeg is not installed, you can install it using the script:
[Install ffmpeg](https://github.com/deadmantfa/helpers/tree/main/mac/ffmpeg)

## Directory Structure
The script expects the following directory structure:
```
Folder Name
 - Chapter 1
   -- Content 1
      --- Video File
      --- MP3 File
      --- Final Output File
   -- Content 2
      --- Video File
      --- MP3 File
      --- Final Output File
 - Chapter 2
   -- Content 1
      --- Video File
      --- MP3 File
      --- Final Output File
   -- Content 2
      --- Video File
      --- MP3 File
      --- Final Output File
```

## Installation
1. Make the script executable:
```bash
chmod +x process_media.sh
```
2. Move the script to /usr/local/bin or any other directory on your PATH:
```bash
sudo mv process_media.sh /usr/local/bin/process_media
```

## Usage
To run the script, use the following command:
```bash
process_media /path/to/media
```

Replace /path/to/media with the path to your media directory.

## Notes
The script assumes that there is only one .mp4 and one .mp3 file in each content directory. If there are more, it will only find one of them. If you need to handle multiple files, the script will need to be modified.
This script is not for everyone but you can use it as a template for something else you might be doing.
