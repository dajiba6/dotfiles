#!/bin/bash

# set up symbolic links for bashrc and vimrc
  echo "Deleting existing .bashrc file..."
  rm ~/.bashrc

  echo "Deleting existing .vimrc file..."
  rm ~/.vimrc

echo "Creating dotfile links!"
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/vimrc ~/.vimrc

echo "config set up DONE!"
