
# Delete Old Dump Files Script

## Overview
This script automatically deletes .dmp (dump) files that are older than a specified number of days from a target directory. It helps manage disk space by removing outdated dump files.
## Features
- Deletes .dmp files older than 30 days (default).
- Customizable directory path.
- Uses Windows Batch scripting for automation.

## How It Works
- The script calculates the current date.
- It determines the threshold date (current date minus 30 days).
- It scans the specified directory for .dmp files.
- If a file's last modified date is older than the threshold, it is deleted.

## Usage
- Open Notepad and copy the script into a new file.
-  Save it with a .bat extension (e.g., cleanup_dumps.bat).
-  Modify the directory path if needed:
set "directory=user\appdata\...\VDM\Dumps"
-  Double-click the .bat file to run it manually, or schedule it with Task Scheduler for automated cleanup.
## Customization
- To change the number of days to keep files, modify this line:
set days_threshold=30
- Change 30 to the desired number of days.

## Notes
- Ensure that the directory path is correct before running.
- You may need administrative privileges if deleting files from protected folders.
- Use with caution, as deleted files cannot be recovered.
