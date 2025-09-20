#!/usr/bin/env python3

import os
import subprocess

def windows_to_unix_path(path):
    # Use cygpath to convert Windows paths to Unix paths
    try:
        unix_path = subprocess.check_output(['cygpath', '-u', path]).decode().strip()
        return unix_path
    except Exception as e:
        # If cygpath is not available, replace backslashes with slashes
        return path.replace('\\', '/')

def main():
    # Get the absolute path to the current directory
    current_dir = os.path.abspath(os.getcwd())

    # List to hold the paths to session directories
    session_dirs = []

    # Walk through the current directory
    for root, dirs, files in os.walk(current_dir):
        # Skip hidden directories
        dirs[:] = [d for d in dirs if not d.startswith('.')]
        # Check if 'ROOT' file exists in the directory
        if 'ROOT' in files:
            # Add the directory to the list
            session_dirs.append(root)

    # Remove duplicates and sort the list
    session_dirs = sorted(set(session_dirs))

    # Generate lines for the ROOTS file
    roots_lines = []
    for dir_path in session_dirs:
        # Convert the Windows path to Unix-style path
        unix_path = windows_to_unix_path(dir_path)
        # Replace the home directory path with '~'
        home_dir = os.path.expanduser('~')
        home_dir_unix = windows_to_unix_path(home_dir)
        if unix_path.startswith(home_dir_unix):
            unix_path = unix_path.replace(home_dir_unix, '~', 1)
        roots_lines.append(unix_path)

    # Output the lines
    print("\n".join(roots_lines))

if __name__ == "__main__":
    main()
