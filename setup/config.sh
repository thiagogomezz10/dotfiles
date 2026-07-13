#!/usr/bin/env bash

# Get the directory where this script is located
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set defaults
install_deps=true
pkg_manager="arch"

usage() {
  echo "Usage: $0 [-b] [-p arch|brew]" >&2
}

# Parse flags
while getopts ":bp:" opt; do
  case "$opt" in
  b)
    install_deps=false
    ;;
  p)
    case "$OPTARG" in
    arch | brew)
      pkg_manager="$OPTARG"
      ;;
    *)
      echo "Error: -p must be 'arch' or 'brew'" >&2
      usage
      exit 1
      ;;
    esac
    ;;
  :)
    echo "Error: -$OPTARG requires an argument" >&2
    usage
    exit 1
    ;;
  \?)
    echo "Error: Unknown flag -$OPTARG" >&2
    usage
    exit 1
    ;;
  esac
done
shift "$((OPTIND - 1))"

if [[ $# -ne 0 ]]; then
  echo "Error: Unexpected argument: $1" >&2
  usage
  exit 1
fi

# Install dependencies if requested
if [[ "$install_deps" == true ]]; then
  echo "Installing dependencies using $pkg_manager..."
  "$script_dir/install-cli.sh" -p "$pkg_manager" || {
    echo "Failed to install dependencies" >&2
    exit 1
  }
fi

# Source the copy.sh script
source "$script_dir/copy.sh" || {
  echo "Failed to source copy.sh from $script_dir" >&2
  exit 1
}

# Step 1: Copy the config directory
source_config_dir="$script_dir/../config"
dest_config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

if ! copy_with_backup "$source_config_dir" "$dest_config_dir"; then
  echo "Failed to copy config directory" >&2
  exit 1
fi

# Step 2: Handle the bashrc file
source_bashrc="$dest_config_dir/bashrc"
dest_bashrc="$HOME/.bashrc"

# Check if the source bashrc exists
if [[ ! -e "$source_bashrc" ]]; then
  echo "Error: Source bashrc file '$source_bashrc' does not exist." >&2
  exit 1
fi

# If the destination bashrc exists, back it up
if [[ -e "$dest_bashrc" ]]; then
  timestamp=$(date +"%Y-%m-%d-%H-%M-%S") || {
    echo "Error: Failed to generate timestamp." >&2
    exit 1
  }
  backup_dir="$HOME/.backups"
  mkdir -p "$backup_dir" || {
    echo "Error: Failed to create backup directory '$backup_dir'." >&2
    exit 1
  }
  backup_file="$backup_dir/bashrc-backup-$timestamp"
  echo "Backing up '$dest_bashrc' to '$backup_file'..."
  if mv "$dest_bashrc" "$backup_file"; then
    echo "Backup created at '$backup_file'"
  else
    echo "Error: Failed to backup '$dest_bashrc'." >&2
    exit 1
  fi
fi

# Move the source bashrc to destination
echo "Moving '$source_bashrc' to '$dest_bashrc'..."
if mv "$source_bashrc" "$dest_bashrc"; then
  echo "Move completed."
else
  echo "Error: Failed to move '$source_bashrc' to '$dest_bashrc'." >&2
  exit 1
fi
