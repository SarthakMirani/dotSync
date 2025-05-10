#!/bin/bash

# Array of dotfiles to backup – you can add more here
DOTFILES=(
  "$HOME/.bashrc"
  "$HOME/.zshrc"
  "$HOME/.gitconfig"
)

# Target directory to save backed-up dotfiles
TARGET_DIR="$HOME/dotSync/dotfiles"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

echo "Backing up dotfiles to $TARGET_DIR..."

# Loop through and copy each file
for file in "${DOTFILES[@]}"; do
  if [ -f "$file" ]; then
    cp "$file" "$TARGET_DIR"
    echo "✔ Backed up: $file"
  else
    echo "✖ Skipped (not found): $file"
  fi
done

echo "✅ Backup completed."
