#!/bin/bash -e

DOTFILES_LOCATION="../stowed-files/polybar/.config/polybar"
CONFIG_LOCATION="/.config/polybar"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

#git clone https://github.com/Yucklys/polybar-nord-theme
#rm ./polybar-nord-theme/.git* -rf
#cp -Rf ./polybar-nord-theme/* $DOTFILES_LOCATION
#rm ./polybar-nord-theme -rf

mkdir -p $EXPORT_LOCATION
echo "Copying polybar files to $EXPORT_LOCATION"
cp -Rf $DOTFILES_LOCATION/* $EXPORT_LOCATION/

