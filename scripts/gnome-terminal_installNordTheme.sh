#!/bin/bash -e

git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
./nord-gnome-terminal/src/nord.sh
rm -rf ./nord-gnome-terminal/

echo "Nord Theme script ran" 
