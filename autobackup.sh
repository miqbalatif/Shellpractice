#!/bin/bash

# Source directory
source_dir="/home/atif/Desktop/shellpract/work"

# Backup directory
backup_dir="/home/atif/Desktop/shellpract"

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Get today's date in YYYYMMDD format
datestamp=$(date "+%Y%m%d")

# Create a unique folder name for today's backup
backup_folder="$backup_dir/backup_$datestamp"

# Copy the contents of source directory to the backup folder
cp -r "$source_dir" "$backup_folder"

# Display a message indicating the backup is complete
echo "Backup created at $backup_folder"

# Check if the backup directory already exists
if [ -d "$backup_folder" ]; then
    # Remove the old backup directory
    old_backup=$(find "$backup_dir" -maxdepth 1 -type d -name "backup_*" -not -path "$backup_folder" | sort | head -n 1)
    if [ -n "$old_backup" ]; then
        echo "Deleting old backup: $old_backup"
        rm -rf "$old_backup"
    fi
fi

exit 0
