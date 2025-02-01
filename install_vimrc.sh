#!/bin/bash

command -v vim >/dev/null 2>&1 ||
    { echo >&2 "Vim is required, but it's not installed. Aborting."; exit 1; }

# Check if a .vimrc file exists
file=".vimrc"
if [[ -f $HOME/$file && -s $HOME/$file ]]; then
    echo Non-empty $file found in $HOME -- Creating a backup of it.
    mv $HOME/$file $HOME/.vimrc_backup
fi

# Copy this .vimrc file to the target directory. For any changes just change the .vimrc file in this git repo
# then run this file to copy the new version to the target directory.
cp $file $HOME/$file
echo Copied $file to $HOME.

