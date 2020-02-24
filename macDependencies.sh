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


# install oh-my-zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install rclone
curl https://rclone.org/install.sh | sudo bash
