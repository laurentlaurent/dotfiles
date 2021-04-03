# These two lines
PATH_TO_DOTFILES="/dotfiles/stowed-files/doom-emacs/.doom.d"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"

CONFIG_LOCATION="/.doom.d"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

mkdir -p $EXPORT_LOCATION
echo "Copying doom-emacs files to $EXPORT_LOCATION"
cp -Rf $IMPORT_LOCATION/* $EXPORT_LOCATION/
# This one above
