#!/bin/bash

sudo apt-get update > /dev/null && \
  sudo apt-get install -y -qq \
    zsh \
    vim \
    silversearcher-ag \
    tmux \
    ranger \
    mpv \
    inotify-tools \
    konsole

./ubuntudeps/neovim.sh
./ubuntudeps/fd.sh
./ubuntudeps/ctag.sh

if [[ $DISPLAY ]]; then
  ./ubuntudeps/qogir-theme.sh
fi


./ubuntudeps/ghcli.sh
./ubuntudeps/glow.sh
./ubuntudeps/sile.sh
./ubuntudeps/weechat.sh
