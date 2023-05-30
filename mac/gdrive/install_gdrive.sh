#!/bin/bash

# Check if gdrive is installed
if command -v gdrive &> /dev/null; then
    echo "gdrive is already installed."
    exit 0
fi

# Download gdrive tar.gz file
curl -LO https://github.com/glotlabs/gdrive/releases/download/3.9.0/gdrive_macos-x64.tar.gz

# Extract the tar.gz file
tar -xvzf gdrive_macos-x64.tar.gz

# Make the file executable
chmod +x gdrive

# Move the file to /usr/local/bin
sudo mv gdrive /usr/local/bin

# Remove the tar.gz file
rm gdrive_macos-x64.tar.gz

echo "gdrive has been installed. You can authenticate it with 'gdrive about'."
