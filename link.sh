#!/bin/bash

ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh ~/.zsh
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/mackup.cfg ~/.mackup.cfg

git submodule update --init
