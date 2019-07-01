#!/bin/bash

# install deps

echo '#######################'
echo 'installing base applications'
echo '#######################'
brew install --upgrade \
  zsh \
  vim \
  neovim/neovim/neovim \
  fzf \
  the_silver_searcher \
  fd \
  tmux

echo '#######################'
echo 'installing development and util applications'
echo '#######################'
brew install --upgrade \
  neofetch \
  htop \
  yarn

