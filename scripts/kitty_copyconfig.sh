#!/bin/bash -e

PATH_TO_DOTFILES="/dotfiles/stowed-files/kitty/.config/kitty"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"

CONFIG_LOCATION="/.config/kitty"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

echo "Downloading Nord theme"
curl -o $IMPORT_LOCATION/nord.conf https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf

mkdir -p $EXPORT_LOCATION
echo "Copying kitty files to $EXPORT_LOCATION"
cp -Rf $IMPORT_LOCATION/* $EXPORT_LOCATION/
