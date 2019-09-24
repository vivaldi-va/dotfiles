#!/bin/bash

# install deps

echo '#######################'
echo 'installing base applications'
echo '#######################'
brew install --upgrade \
  coreutils \
  zsh \
  vim \
  neovim/neovim/neovim \
  fzf \
  the_silver_searcher \
  fd \
  tmux \
  highlight

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

echo '#######################'
echo 'installing development and util applications'
echo '#######################'
brew install --upgrade \
  neofetch \
  htop \
  yarn

