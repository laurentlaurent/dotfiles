#!/bin/bash -e

PATH_TO_DOTFILES="/dotfiles/temp"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"

mkdir -p $IMPORT_LOCATION
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git $IMPORT_LOCATION/nord-gnome-terminal
$IMPORT_LOCATION/nord-gnome-terminal/src/nord.sh
rm -rf $IMPORT_LOCATION

echo "Nord Theme script ran" 
