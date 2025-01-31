#!/bin/bash

command -v vim >/dev/null 2>&1 ||
    { echo >&2 "Vim is required, but it's not installed. Aborting."; exit 1; }

# Check if a .vimrc file exists
file=".vimrc"
if [[ -f "$HOME/$file" && -s "$HOME/$file" ]]; then
    echo Non-empty $file found in $HOME -- Creating a backup of it.
    mv $HOME/$file $HOME/.vimrc_backup
fi

# Move .vimrc file from this directory to the correct directory
mv $file $HOME/$file
echo Moved .vimrc file from this directory to $HOME.

# Create a symlink so future changes can be easily added
ln -s $HOME/$file $file
ls -l $file

echo Successfully created symlink.
