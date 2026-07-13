#!/usr/bin/env bash
set -euo pipefail

# Check arguments
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <wallpaper-file>" >&2
  exit 1
fi

WALLPAPER_ARG="$1"

# Get absolute path
if [[ "$WALLPAPER_ARG" = /* ]]; then
  ABS_PATH="$WALLPAPER_ARG"
else
  ABS_PATH="$PWD/$WALLPAPER_ARG"
fi

echo "Setting wallpaper to: $ABS_PATH" >&2

# Determine config directory
CONFIG_DIR="${XDG_CONFIG_DIR:-$HOME/.config}"
TARGET_DIR="$CONFIG_DIR/horizon/active"
# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

echo "Using config directory: $TARGET_DIR" >&2

# Change to target directory
cd "$TARGET_DIR"

# Remove existing wallpaper.jpg if present
if [[ -e wallpaper.jpg || -L wallpaper.jpg ]]; then
  echo "Removing existing wallpaper.jpg" >&2
  rm -f wallpaper.jpg
fi

# Create symlink
echo "Creating symlink: wallpaper.jpg -> $ABS_PATH" >&2
ln -s "$ABS_PATH" wallpaper.jpg

echo "Wallpaper set successfully!" >&2
