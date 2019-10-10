#!/bin/bash

# install deps

echo '#######################'
echo 'installing base applications'
echo '#######################'
brew install \
  coreutils \
  zsh \
  vim \
  neovim/neovim/neovim \
  fzf \
  the_silver_searcher \
  fd \
  tmux \
  highlight


echo '#######################'
echo 'installing development and util applications'
echo '#######################'
brew install \
  neofetch \
  htop \
  yarn
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
