#!/usr/bin/env bash

copy_with_backup() {
    local src="$1"
    local dest="$2"

    # Check arguments
    if [[ $# -ne 2 ]]; then
        printf "Usage: copy_with_backup <source_directory> <destination_directory>\n" >&2
        return 1
    fi

    # Check source exists
    if [[ ! -d "$src" ]]; then
        printf "Error: Source directory '%s' does not exist or is not a directory.\n" "$src" >&2
        return 2
    fi

    # Backup destination if it exists
    if [[ -e "$dest" ]]; then
        local timestamp
        timestamp=$(date +"%Y-%m-%d-%H-%M-%S") || {
            printf "Error: Failed to generate timestamp.\n" >&2
            return 3
        }
        local backup_dir="$HOME/.backups/config-backup-$timestamp"
        mkdir -p "$HOME/.backups" || {
            printf "Error: Failed to create backup directory '%s'.\n" "$HOME/.backups" >&2
            return 4
        }
        printf "Backing up '%s' to '%s'...\n" "$dest" "$backup_dir"
        if cp -r "$dest" "$backup_dir"; then
            printf "Backup created at '%s'\n" "$backup_dir"
        else
            printf "Error: Failed to backup '%s'.\n" "$dest" >&2
            return 5
        fi
    fi

    # Remove destination directory contents
    if [[ -e "$dest" ]]; then
        printf "Removing existing destination '%s'...\n" "$dest"
        if rm -rf "$dest"; then
            printf "Removed '%s'.\n" "$dest"
        else
            printf "Error: Failed to remove '%s'.\n" "$dest" >&2
            return 6
        fi
    fi

    # Ensure destination parent directory exists
    mkdir -p "$(dirname "$dest")" || {
        printf "Error: Failed to create parent directory for '%s'.\n" "$dest" >&2
        return 7
    }

    # Copy source to destination
    printf "Copying '%s' to '%s'...\n" "$src" "$dest"
    if cp -r "$src"/. "$dest"/; then
        printf "Copy completed.\n"
        return 0
    else
        printf "Error: Failed to copy '%s' to '%s'.\n" "$src" "$dest" >&2
        return 8
    fi
}

# If script is executed directly, run the function with provided arguments
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    copy_with_backup "$@"
fi