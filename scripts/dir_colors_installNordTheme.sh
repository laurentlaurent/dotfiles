#!/bin/bash -e

git clone https://github.com/arcticicestudio/nord-dircolors.git 
cp -f ./nord-dircolors/src/dir_colors ~/.dir_colors
rm -rf ./nord-dircolors/

echo "Nord Theme installed in .dir_colors" 
