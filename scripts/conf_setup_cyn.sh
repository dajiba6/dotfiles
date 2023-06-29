#!/bin/bash

# set up symbolic links for bashrc and vimrc
echo "Deleting existing .bashrc file..."
rm ~/.bashrc

echo "Deleting existing .vimrc file..."
rm ~/.vimrc

echo "Creating bashrc vimrc links!"
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/vimrc ~/.vimrc


terminator_config=~/.config/terminator/config
dotfiles_config=~/dotfiles/terminator_config

if [ -f "$terminator_config" ]; then
    echo "Deleting $terminator_config"
    rm "$terminator_config"
fi

echo "Creating symbolic link for $terminator_config"
ln -s "$dotfiles_config" "$terminator_config"


echo "config set up DONE!"
