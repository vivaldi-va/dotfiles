#!/bin/bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
  highlight \
  fswatch

# install oh-my-zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo '#######################'
echo 'installing development and util applications'
echo '#######################'
# install neovim
brew tap neovim/neovim && brew install neovim

brew install \
  neofetch \
  htop \
  yarn
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

# install powerline fonts
git clone https://github.com/powerline/fonts.git ~/powerline-fonts && \
  cd ~/powerline-fonts && \
  ./install.sh && \
  rm -rf ~/powerline-fonts

# install rclone
curl https://rclone.org/install.sh | sudo bash
