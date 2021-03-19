#!/bin/bash -e

PATH_TO_DOTFILES="/dotfiles/stowed-files/nvim/.config/nvim"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"

CONFIG_LOCATION="/.config/nvim"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

mkdir -p "$EXPORT_LOCATION/vim-plug/"
echo "Copying nvim files to $EXPORT_LOCATION"
cp -Rf $IMPORT_LOCATION/* $EXPORT_LOCATION/
