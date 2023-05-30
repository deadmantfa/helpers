# GDrive Installation Script
This script is designed to automate the process of installing gdrive, a command-line utility for interacting with Google Drive, on a MacOS system.

## Prerequisites
- Bash
- curl

## Installation
1. Make the script executable:
```bash
chmod +x install_gdrive.sh
```
2. Run the script:
```bash
./install_gdrive.sh
```
3. Authenticate with Google Drive
```bash
gdrive account add
```

## Usage
Once `gdrive` is installed, you can use it to interact with Google Drive from the command line. For example, to upload a file to Google Drive, you can use the following command:

```bash
gdrive upload -p <folder-id> /path/to/file
```
Replace <folder-id> with the folder id you want the files to be uploaded.
Replace /path/to/file with the path to the file you want to upload.

## Notes
This script downloads a precompiled binary of `gdrive`. If you prefer to compile it from source, you would need to clone the `gdrive` GitHub repository and follow the build instructions.

Please be aware that `gdrive` is a third-party tool and not officially supported by Google. Be cautious when using third-party tools that require access to sensitive information like your Google account.
