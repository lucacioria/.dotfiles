#!/bin/bash

ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/gvimrc ~/.gvimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh ~/.zsh
#ln -s gitconfig ~/.gitconfig

git submodule update --init
