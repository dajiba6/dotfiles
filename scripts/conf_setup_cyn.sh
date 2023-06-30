#!/bin/bash

# set up symbolic links for bashrc and vimrc
echo "Deleting existing .bashrc file..."
rm ~/.bashrc

echo "Deleting existing .vimrc file..."
rm ~/.vimrc

echo "Creating bashrc vimrc links!"
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/vimrc ~/.vimrc

# terminator =================
terminator_config=~/.config/terminator/config
dotfiles_terminator_config=~/dotfiles/terminator_config

if [ -f "$terminator_config" ]; then
    echo "Deleting $terminator_config"
    rm "$terminator_config"
    echo "Creating symbolic link for $terminator_config"
    ln -s "$dotfiles_terminator_config" "$terminator_config"
fi

# zsh ========================
zshrc_file="$HOME/.zshrc"
if [ -f "$zshrc_file" ]; then
    echo "Deleting .zshrc file..."
    rm "$zshrc_file"
    echo "Creating symbolic link for zsh"
    ln -s ~/dotfiles/zshrc $zshrc_files
fi


echo "config set up DONE!"
