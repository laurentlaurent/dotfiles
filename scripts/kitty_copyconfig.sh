#!/bin/bash -e

DOTFILES_LOCATION="../stowed-files/kitty/.config/kitty"
CONFIG_LOCATION="/.config/kitty"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

echo "Downloading Nord theme"
curl -o $DOTFILES_LOCATION/nord.conf https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf

mkdir -p $EXPORT_LOCATION
echo "Copying kitty files to $EXPORT_LOCATION"
cp -Rf $DOTFILES_LOCATION/* $EXPORT_LOCATION/

