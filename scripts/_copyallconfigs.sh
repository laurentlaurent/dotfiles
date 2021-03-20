# Install alacritty, picom (jonaburg), nvim, qtile, feh

PATH_TO_DOTFILES="/dotfiles/scripts"
IMPORT_LOCATION="$HOME$PATH_TO_DOTFILES"
CONFIG_LOCATION="/.config/qtile"
EXPORT_LOCATION="$HOME$CONFIG_LOCATION"

echo "Launching Alacritty script"
$IMPORT_LOCATION/alacritty_copyconfig.sh
echo "Launching Picom script"
$IMPORT_LOCATION/picom_copyconfig.sh
echo "Launching Dir Colors script"
$IMPORT_LOCATION/dir_colors_installNordTheme.sh
echo "Launching NeoVim script"
$IMPORT_LOCATION/nvim_copyconfig.sh
echo "Launching Qtile script"
$IMPORT_LOCATION/qtile_copyconfig.sh
