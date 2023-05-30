# Process Media
This script is designed to automate the process of merging video and audio files in a directory using ffmpeg, and then uploading the output to Google Drive. It iterates over each subdirectory in the provided directory, finds the .mp4 and .mp3 files, and then runs the ffmpeg command on them.

## Prerequisites
- Bash
- ffmpeg
- gdrive

If `ffmpeg` is not installed, you can install it using the script:
[Install ffmpeg](https://github.com/deadmantfa/helpers/tree/main/mac/ffmpeg)

If `gdrive` is not installed, you can install it using the script:
[Install gdrive](https://github.com/deadmantfa/helpers/tree/main/mac/gdrive)

## Directory Structure
The script expects the following directory structure:
```
Folder Name
 - Chapter 1
   -- Content 1
      --- Video File
      --- MP3 File
   -- Content 2
      --- Video File
      --- MP3 File
 - Chapter 2
   -- Content 1
      --- Video File
      --- MP3 File
   -- Content 2
      --- Video File
      --- MP3 File
```

The script will create an output directory with the following structure:
```
Folder Name
 - output
   - Folder Name
     - Chapter 1
       -- Content 1
          --- Final Output File
       -- Content 2
          --- Final Output File
     - Chapter 2
       -- Content 1
          --- Final Output File
       -- Content 2
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
process_media /path/to/media [Google Drive Folder ID]
```
Replace `/path/to/media` with the path to your media directory. The Google Drive Folder ID is optional. If provided, the output will be uploaded to the specified Google Drive folder. If not provided, the output will be uploaded to the root of Google Drive.

## Notes
The script assumes that there is only one .mp4 and one .mp3 file in each content directory. If there are more, it will only find one of them. If you need to handle multiple files, the script will need to be modified.
This script is not for everyone but you can use it as a template for something else you might be doing.
