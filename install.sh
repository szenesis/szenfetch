#!/bin/bash

INSTALL_DIR="/usr/local/bin"

SCRIPT_NAME="szenfetch.sh"
TARGET_NAME="szenfetch"

echo "Copying $SCRIPT_NAME -> $INSTALL_DIR/$TARGET_NAME"
sudo cp $SCRIPT_NAME $INSTALL_DIR/$TARGET_NAME

echo "Permission to work is granted: $INSTALL_DIR/$TARGET_NAME"
sudo chmod +x $INSTALL_DIR/$TARGET_NAME

echo "Installation complete. You can use the 'szenfetch' command."
