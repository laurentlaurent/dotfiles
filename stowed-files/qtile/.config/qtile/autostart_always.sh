#!/bin/sh

# Set functions

# Functions

cmd_exist() { unalias "$1" >/dev/null 2>&1 ; command -v "$1" >/dev/null 2>&1 ;}
__kill() { kill -9 "$(pidof "$1")" >/dev/null 2>&1 ; }
__start() { sleep 1 && "$@" >/dev/null 2>&1 & }
__running() { pidof "$1" >/dev/null 2>&1 ;}

# Set the wallpaper
feh --bg-scale ~/dotfiles/stowed-files/wallpapers/wallpaper.jpg &
autorandr -c
# Apps to autostart
if cmd_exist picom ; then
    __kill picom
    __start picom --experimental-backends
fi