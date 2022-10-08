#!/usr/bin/env bash

if ! command -v stow &> /dev/null
then
    echo "stow could not be found. Please install stow before running this script"
    return -1
fi

# install sub modules (my vim plugins)
git submodule update --init
if [ $? -eq 0 ]; then
    echo "Submodules installed" 
else
    echo "Failed to install submodules" 
fi

stow .
if [ $? -eq 0 ]; then
    echo "dotfiles stowed"
else
    echo "Failed to stow dotfiles" 
fi
