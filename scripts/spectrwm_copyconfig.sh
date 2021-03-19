#!/bin/bash -e

PATH_TO_DOTFILES="/dotfiles/stowed-files/spectrwm/.config/spectrwm"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"

CONFIG_LOCATION="/.config/spectrwm"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

mkdir -p $EXPORT_LOCATION
echo "Copying spectrwm files to $EXPORT_LOCATION"
cp -Rf $IMPORT_LOCATION/* $EXPORT_LOCATION/
