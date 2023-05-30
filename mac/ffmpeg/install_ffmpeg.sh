#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew is not installed. Installing Homebrew now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to the PATH
    echo 'Adding Homebrew to the PATH...'
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Check if FFmpeg is installed
if ! command -v ffmpeg &> /dev/null
then
    echo "FFmpeg is not installed. Installing FFmpeg now..."
    brew install ffmpeg

    # Enable FFmpeg to start at login
    brew services start ffmpeg
else
    echo "FFmpeg is already installed."
fi

# Update Homebrew and FFmpeg
echo "Updating Homebrew and FFmpeg..."
brew update && brew upgrade ffmpeg

echo "FFmpeg installation is complete and up-to-date."
