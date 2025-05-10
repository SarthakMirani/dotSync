#!/bin/bash

# dotSync: Backup script for personal dotfiles
# Author: Sarthak
# Description: Copies selected dotfiles and directories from $HOME into dotSync/dotfiles/

# Exit if any command fails
set -e

# Define source and target directories
SOURCE_DIR="$HOME"
TARGET_DIR="$(dirname "$(realpath "$0")")/../dotfiles"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

echo "Starting dotfiles backup..."

# List of dotfiles/folders to back up
dotfiles=(
  ".bash_logout"
  ".config"
  ".gtkrc-2.0"
  ".icons"
  ".local"
  ".profile"
  ".themes"
)

# Loop through each dotfile and copy if it exists
for file in "${dotfiles[@]}"; do
  SRC="$SOURCE_DIR/$file"
  DEST="$TARGET_DIR/$file"

  if [ -e "$SRC" ]; then
    echo "Backing up $file..."
    # Use rsync for safe recursive copy
    rsync -a --delete "$SRC" "$DEST"
  else
    echo "Skipping $file — not found."
  fi
done

echo "✅ Backup complete. Files saved to $TARGET_DIR"

