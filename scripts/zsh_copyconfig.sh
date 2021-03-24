#!/bin/bash -e
PATH_TO_DOTFILES="/dotfiles/stowed-files/zsh"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"

echo "Copying zsh files to $HOME" 
cp -f $IMPORT_LOCATION/.zshrc $HOME/.zshrc

