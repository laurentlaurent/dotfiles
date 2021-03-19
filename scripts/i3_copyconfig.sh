#!/bin/bash -e

DOTFILES_LOCATION="../stowed-files/i3/.config/i3"
PATH_TO_DOTFILES="/dotfiles/stowed-files/i3/.config/i3"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"
CONFIG_LOCATION="/.config/i3"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

mkdir -p $EXPORT_LOCATION
echo "Copying i3 files to $EXPORT_LOCATION"
cp -Rf $IMPORT_LOCATION/* $EXPORT_LOCATION/

