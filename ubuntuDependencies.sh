#!/bin/bash

# weechat sources list
sudo sh -c 'echo "deb https://weechat.org/ubuntu $(lsb_release -cs) main" >> /etc/apt/sources.list.d/weechat.list'
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E

sudo apt-get update > /dev/null && \
  sudo apt-get install -y \
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

# Qogir theme
sudo apt install -qq gtk2-engines-murrine gtk2-engines-pixbuf
wget https://github.com/vinceliuice/Qogir-theme/archive/2019-08-31.tar.gz -O ~/qogir.tar.gz && \
  tar xvzf ~/qogir.tar.gz && \
  cd ~/qogir && \
  ./install.sh -i && \
  rm -rf ~/qogir ~/qogir.tar.gz

# SILE typesetter
sudo add-apt-repository ppa:sile-typesetter/sile
sudo apt update
sudo apt install sile

# gh cli
LATEST_GH=$(curl -sL api.github.com/repos/cli/cli/releases/latest | jq .name | sed 's/v//' | sed 's/"//g')
echo $LATEST_GH
GH_CLI_URL=https://github.com/cli/cli/releases/download/v${LATEST_GH}/gh_${LATEST_GH}_linux_amd64.deb
echo $GH_CLI_URL

curl -sL ${GH_CLI_URL} && \
  sudo dpkg -i gh_${LATEST_GH}_linux_amd64.deb && \
  rm gh_${LATEST_GH}_linux_amd64.deb

