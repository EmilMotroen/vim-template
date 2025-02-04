#!/bin/bash

command -v vim >/dev/null 2>&1 ||
    { echo >&2 "Vim is required, but it's not installed. Aborting."; exit 1; }

help() {
    echo "Usage: $0 {vimrc|cs}"
    echo "vimrc  - install .vimrc file"
    echo "cs     - install colorscheme"
    echo "none   - No operation"
    exit 0
}

vimrc() {
    # Check if a .vimrc file exists
    local file=".vimrc"
    if [[ -f $HOME/$file && -s $HOME/$file ]]; then
        echo "Non-empty $file found in $HOME -- Creating a backup of it."
        mv $HOME/$file $HOME/.vimrc_backup
    fi

    # Copy this .vimrc file to the target directory. For any changes just change the .vimrc file in this git repo
    # then run this file to copy the new version to the target directory.
    cp $file $HOME/$file
    echo "Copied $file to $HOME."
}

cs() {
    local COLORSCHEME_DEST="$HOME/.vim/colors"
    local CS="cs.vim"
    
    # Check if the correct directory exists
    if [ ! -d $COLORSCHEME_DEST ]; then
        echo "$COLORSCHEME_DEST missing, adding it."
        mkdir $COLORSCHEME_DEST
    fi
    
    # Check if a colorscheme file already exists
    if [[ -f $COLORSCHEME_DEST/$CS && -s $COLORSCHEME_DEST/$CS  ]]; then
        echo "Non-empty $CS found in $COLORSCHEME_DEST -- Creating a backup of it."
        mv $COLORSCHEME_DEST/$CS $COLORSCHEME_DEST/cs_backup.vim
    fi

    # Copy the cs file to the target directory
    cp $CS $COLORSCHEME_DEST/$CS
    echo "Copied $CS to $COLORSCHEME_DEST."
}

OPERATION=${1:-None} # If no argument is provided default to None and quit.

# Convert input to lowercase
OPERATION=$(echo "$OPERATION" | tr '[:upper:]' '[:lower:]')

case $OPERATION in
    vimrc)
        echo "Install .vimrc file."
        vimrc
        ;;
    cs)
        echo "Install colorscheme."
        cs
        ;;
    help)
        help
        ;;
    none)
        echo "No argument given. Use './install.sh help' to see arguments."
        exit 0
        ;;
    *)
        echo "Invalid argument. Exiting."
        exit 1
        ;;
esac

