#!/bin/bash

# update_apps.sh
# This script automates the update of system packages and selected .deb-based applications (Zoom, Discord, Slack) on Ubuntu.

# Exit immediately if any command exits with a non-zero status
set -e

# Update and upgrade system packages using APT
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y
echo "System packages updated successfully."

# Function to download and install a .deb package from a URL
# Arguments:
#   $1 - Name of the application (used for logging and temporary file naming)
#   $2 - Direct URL to the .deb package
install_deb() {
    local name=$1
    local url=$2
    local deb_file="/tmp/${name}.deb"

    echo "Downloading latest version of ${name}..."
    wget -O "$deb_file" "$url"
    
    echo "Installing ${name}..."
    sudo dpkg -i "$deb_file" || sudo apt -f install -y

    echo "${name} installed or updated successfully."
    rm -f "$deb_file"
}

# Update Zoom
install_deb "zoom" "https://zoom.us/client/latest/zoom_amd64.deb"

# Update Discord
install_deb "discord" "https://discord.com/api/download?platform=linux&format=deb"

# Update Slack
install_deb "slack" "https://downloads.slack-edge.com/linux_releases/slack-desktop-latest-amd64.deb"

echo "All applications have been updated."
