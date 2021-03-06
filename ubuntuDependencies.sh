#!/bin/bash

# weechat sources list
sudo sh -c 'echo "deb https://weechat.org/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/weechat.list'
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E

sudo apt-get update > /dev/null && \
  sudo apt-get install -y -qq \
    zsh \
    vim \
    silversearcher-ag \
    tmux \
    weechat \
    ranger \
    mpv \
    inotify-tools

# neovim
curl -sL https://github.com/neovim/neovim/releases/latest/download/nvim.appimage > /tmp/nvim.appimage && \
  sudo mv /tmp/nvim.appimage /usr/local/bin/nvim && \
  chmod u+x /usr/local/bin/nvim

# python support
pip3 install pynvim

# FD find
wget https://github.com/sharkdp/fd/releases/download/v7.3.0/fd_7.3.0_amd64.deb -O ~/fd.deb && \
  sudo dpkg -i ~/fd.deb && \
  rm ~/fd.deb

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Universal ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install

if [[ $DISPLAY ]]; then
  ./ubuntudeps/qogir-theme.sh
fi

# SILE typesetter
sudo add-apt-repository ppa:sile-typesetter/sile
sudo apt-get update > /dev/null
sudo apt-get install -y -qq sile

./ubuntudeps/ghcli.sh
./ubuntudeps/glow.sh
