#!/bin/bash -e
PATH_TO_DOTFILES="/dotfiles/temp"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"

mkdir -p $IMPORT_LOCATION
git clone https://github.com/arcticicestudio/nord-dircolors.git $IMPORT_LOCATION/nord-dircolors
cp -f $IMPORT_LOCATION/nord-dircolors/src/dir_colors $HOME/.dir_colors
rm -rf $IMPORT_LOCATION

echo "Nord Theme installed in .dir_colors" 
