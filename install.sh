#!/bin/bash

command -v vim >/dev/null 2>&1 ||
    { echo >&2 "Vim is required, but it's not installed. Aborting."; exit 1; }

help() {
    echo "Usage: $0 {vimrc|cs|syntax=LANG}"
    echo "vimrc  - install .vimrc file"
    echo "cs     - install colorscheme"
    echo "syntax - Install syntax highlighting for specified language (e.g., syntax=cpp)"
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

syntax() {
    local DIR="$HOME/.vim/syntax"
    # Check if the correct directory exists
    if [ ! -d $DIR ]; then
        echo "$DIR missing. Adding it."
        mkdir $DIR
    fi

    local lang=$1
    case $lang in
        anb)
            cp syntax/anb.vim $DIR/anb.vim
            echo "AnB syntax highlighting installed."
            sed -i '/" Syntax highlighting/a autocmd BufNewFile,BufRead *.AnB set filetype=AnB"' .vimrc
            ;;
        cpp)
            cp syntax/cpp.vim $DIR/cpp.vim
            echo "C++ syntax highlighting installed."
            sed -i '/" Syntax highlighting/a autocmd BufNewFile,BufRead *.cpp set filetype=cpp"' .vimrc
            ;;
        *)
            echo "Unsupported syntax: $lang"
            exit 1
            ;;
    esac

    echo "Added autocmd for $lang to .vimrc. Update .vimrc file."
    vimrc
}

OPERATION=${1:-None} # If no argument is provided default to None and quit.

# Convert input to lowercase
OPERATION=$(echo "$OPERATION" | tr '[:upper:]' '[:lower:]')

# Check if operation includes a syntax argument
if [[ $OPERATION == syntax=* ]]; then
    SYNTAX_LANG=${OPERATION#syntax=}
    OPERATION="syntax"
fi

case $OPERATION in
    vimrc)
        echo "Installing .vimrc file."
        vimrc
        ;;
    cs)
        echo "Installing colorscheme."
        cs
        ;;
    syntax)
        echo "Installing syntax highlighting for $SYNTAX_LANG"
        syntax "$SYNTAX_LANG"
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

