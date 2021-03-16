#!/bin/bash -e

DOTFILES_LOCATION="../stowed-files/nvim/.config/nvim"
CONFIG_LOCATION="/.config/nvim"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

mkdir -p "$EXPORT_LOCATION/vim-plug/"
echo "Copying nvim files to $EXPORT_LOCATION"
cp -Rf $DOTFILES_LOCATION/* $EXPORT_LOCATION/

