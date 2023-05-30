# FFmpeg Installer for macOS

This script installs FFmpeg on macOS using Homebrew. It also ensures that FFmpeg is kept up-to-date.

## Prerequisites

- You need to have administrator rights on your Mac to install software system-wide.

## Installation

1. Save the script to a file, for example, `install_ffmpeg.sh`.

2. Make the script executable by running the following command in the terminal:

    ```bash
    chmod +x install_ffmpeg.sh
    ```

3. Run the script with this command:

    ```bash
    ./install_ffmpeg.sh
    ```

## What the Script Does

1. Checks if Homebrew is installed on your system. If not, it installs Homebrew.

2. Installs FFmpeg using Homebrew.

3. Ensures that FFmpeg starts at login.

4. Updates Homebrew and FFmpeg to ensure they are up-to-date.

## Note

This script is "future-proof" in the sense that it will keep FFmpeg updated as long as Homebrew is maintained and continues to support FFmpeg. However, there's no guarantee that future versions of macOS won't introduce changes that could potentially break this script.
