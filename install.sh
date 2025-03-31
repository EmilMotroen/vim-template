#!/bin/bash

command -v vim >/dev/null 2>&1 ||
    { echo >&2 "Vim is required, but it's not installed. Aborting."; exit 1; }

VIMVERSION=$(vim --version | head -1 | cut -d ' ' -f 5)
if [[ $VIMVERSION < 9.1 ]]; then
    echo "The plugin YouCompleteMe requires the Vim version to be at least 9.1.0016. Update Vim to install. Exiting..."
    exit 1
fi

help() {
    echo "Usage: $0 {vimrc|md}"
    echo "vimrc  - install .vimrc file"
    echo "md     - install Markdown CSS for Markdown-preview in Vim"
    echo "none   - No operation"
    exit 0
}

vimrc() {
    if ! check_connection; then
        echo "ERROR: no internet connection. An internet connection is required to install plugins. Exiting..."
        exit 1
    fi

    # Check if a .vimrc file exists
    local file=".vimrc"
    if [[ -f $HOME/$file && -s $HOME/$file ]]; then
        echo "Non-empty $file found in $HOME -- Creating a backup of it."
        mv $HOME/$file $HOME/.vimrc_backup
    fi

    vim_dir

    # Copy this .vimrc file to the target directory. For any changes just change the .vimrc file in this git repo
    # then run this script to copy the new version to the target directory.
    cp $file $HOME/$file
    echo "Copied main $file to $HOME."

    copy_subfiles
    
    echo "Installing plugins..."
    vim +PluginInstall +qall
    echo "Done installing plugins. It is recommended to open a file with Vim to check if it was successful."
}

copy_subfiles() {
    echo "Copy vim subfiles:"
    files=`ls ./.vim/*.vim`
    for file in $files; do
        echo $'\t'$file
    done
    cp ./.vim/* $HOME/.vim/ 
    echo "Done copying additional vim files."
}

check_connection() {
    if ping -c 1 8.8.8.8 &>/dev/null; then
        true
    else
        false
    fi
}

vim_dir() {
    # Check if a .vim subdirectory exists
    local path="$HOME/.vim/"
    
    if [ -d "$path" ]; then
        echo "$path directory already exists."
    else
        # Create a .vim directory for subfiles
        mkdir -p $path 
        echo "Created $path directory."
   fi
}

md() {
    local file="markdown.css"
    local path="$HOME/.vim/css"

    vim_dir 
    # Make a css directory if there isn't one
    mkdir -p $path 

    if [[ -f $path/$file && -s $path/$file ]]; then
        echo "Non-empty $file found in $path -- Creating a backup of it."
        mv $path/$file $path/markdown_backup.css
    fi

    cp $file $path/$file
    echo "Copied $file to $path."
}

OPERATION=${1:-None} # If no argument is provided default to None and quit.

# Convert input to lowercase
OPERATION=$(echo "$OPERATION" | tr '[:upper:]' '[:lower:]')

case $OPERATION in
    vimrc|.vimrc)
        echo "Installing .vimrc file."
        vimrc
        ;;
    md|markdown)
        echo "Installing markdown.css"
        md
        ;;
    help)
        help
        ;;
    none | *)
        echo "Invalid argument provided. Use './install.sh help' to see arguments."
        exit 1
        ;;
esac

