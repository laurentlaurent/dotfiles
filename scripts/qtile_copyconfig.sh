#!/bin/bash -e

DOTFILES_LOCATION="../stowed-files/qtile/.config/qtile"
CONFIG_LOCATION="/.config/qtile"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

mkdir -p $EXPORT_LOCATION
echo "Copying qtile files to $EXPORT_LOCATION"
cp -Rf $DOTFILES_LOCATION/* $EXPORT_LOCATION/
