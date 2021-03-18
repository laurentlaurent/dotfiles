#!/bin/bash -e

DOTFILES_LOCATION="../stowed-files/spectrwm/.config/spectrwm"
CONFIG_LOCATION="/.config/spectrwm"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

mkdir -p $EXPORT_LOCATION
echo "Copying spectrwm files to $EXPORT_LOCATION"
cp -Rf $DOTFILES_LOCATION/* $EXPORT_LOCATION/
