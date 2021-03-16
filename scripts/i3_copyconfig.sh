#!/bin/bash -e

DOTFILES_LOCATION="../stowed-files/i3/.config/i3"
CONFIG_LOCATION="/.config/i3"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

echo "Copying i3 files to $EXPORT_LOCATION"
cp -Rf $DOTFILES_LOCATION/* $EXPORT_LOCATION/

