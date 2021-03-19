#!/bin/bash -e

PATH_TO_DOTFILES="/dotfiles/stowed-files/alacritty/.config/alacritty"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"

CONFIG_LOCATION="/.config/alacritty"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

mkdir -p $EXPORT_LOCATION
echo "Copying alacritty files to $EXPORT_LOCATION"
cp -Rf $IMPORT_LOCATION/* $EXPORT_LOCATION/

