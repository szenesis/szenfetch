#!/bin/bash

INSTALL_DIR="/home/$USER/.local/bin"
SCRIPT_NAME="szenfetch.sh"
TARGET_NAME="szenfetch"

# Ensure INSTALL_DIR exists
mkdir -p "$INSTALL_DIR"

# Copy the script without sudo
echo "Copying $SCRIPT_NAME -> $INSTALL_DIR/$TARGET_NAME"
cp "$SCRIPT_NAME" "$INSTALL_DIR/$TARGET_NAME"

# Make the script executable
chmod +x "$INSTALL_DIR/$TARGET_NAME"

echo "Installation complete. You can now use the 'szenfetch' command."
