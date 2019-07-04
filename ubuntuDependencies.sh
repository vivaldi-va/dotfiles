#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update > /dev/null && \
  sudo apt-get install -y \
    zsh \
    neovim \
    vim \
    silversearcher-ag \
    tmux

wget https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb -O ~/fd.deb && \
  sudo dpkg -i ~/fd.deb && \
  rm ~/fd.deb

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
