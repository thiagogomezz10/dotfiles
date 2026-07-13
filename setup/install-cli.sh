#!/usr/bin/env bash

# Check if exactly one argument is provided
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <arch|brew>" >&2
  exit 1
fi

# Validate the argument
case "$1" in
arch | brew)
  ;;
*)
  echo "Error: Argument must be either 'arch' or 'brew'" >&2
  exit 1
  ;;
esac

# Determine the package manager command
if [[ "$1" == "arch" ]]; then
  pkg_manager="sudo pacman -S --noconfirm"
else
  pkg_manager="brew install"
fi

# Path to the package list file
pkgs_file="/home/thiago/dotfiles/setup/packages/cli-pkgs"

# Check if the package list file exists
if [[ ! -f "$pkgs_file" ]]; then
  echo "Error: Package list file not found at $pkgs_file" >&2
  exit 1
fi

# Read each package and install it
while IFS= read -r pkg || [[ -n "$pkg" ]]; do
  # Skip empty lines and comments (if any)
  if [[ -z "$pkg" || "$pkg" =~ ^[[:space:]]*# ]]; then
    continue
  fi

  echo "Installing $pkg..."
  if ! $pkg_manager "$pkg"; then
    echo "Warning: Failed to install $pkg" >&2
    # Continue with next package
  fi
done <"$pkgs_file"

echo "Installation process completed."
