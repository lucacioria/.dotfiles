#!/bin/bash

git submodule foreach git pull origin master

# gocode
curl https://raw.github.com/nsf/gocode/master/vim/autoload/gocomplete.vim \
  > vim/custom_bundles/gocode/autoload/gocomplete.vim
curl https://raw.github.com/nsf/gocode/master/vim/ftplugin/go.vim \
  > vim/custom_bundles/gocode/ftplugin/go.vim
