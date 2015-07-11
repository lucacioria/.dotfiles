#!/bin/bash

ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh ~/.zsh
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/vifmrc ~/.vifmrc

git submodule update --init
