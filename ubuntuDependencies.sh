#!/bin/bash

sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update > /dev/null && \
  sudo apt-get install -y \
    zsh \
    neovim \
    vim \
    silversearcher-ag \
    tmux

# FD find
wget https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb -O ~/fd.deb && \
  sudo dpkg -i ~/fd.deb && \
  rm ~/fd.deb

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# install weechat
sudo sh -c 'echo "deb https://weechat.org/ubuntu $(lsb_release -cs) main" >> /etc/apt/sources.list.d/weechat.list'
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E
sudo apt-get update > /dev/null && \
  sudo apt-get install -y weechat
