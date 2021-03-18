#!/bin/bash -e

DOTFILES_LOCATION="../stowed-files/alacritty/.config/alacritty"
CONFIG_LOCATION="/.config/alacritty"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

mkdir -p $EXPORT_LOCATION
echo "Copying alacritty files to $EXPORT_LOCATION"
cp -Rf $DOTFILES_LOCATION/* $EXPORT_LOCATION/

