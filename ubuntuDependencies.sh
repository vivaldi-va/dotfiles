#!/bin/bash

sudo apt-get update > /dev/null && \
  sudo apt-get install -y -qq \
    zsh \
    vim \
    silversearcher-ag \
    tmux \
    ranger

./ubuntudeps/neovim.sh
./ubuntudeps/fd.sh
./ubuntudeps/ctag.sh
./ubuntudeps/ghcli.sh
./ubuntudeps/sile.sh
./ubuntudeps/weechat.sh

# install xfce theme
if [[ $DISPLAY ]]; then
  ./ubuntudeps/qogir-theme.sh
fi

# install desktop-only stuff
if [[ $DISPLAY ]]; then
  ./ubuntudeps/rofi.sh
  ./ubuntudeps/glow.sh

  sudo apt-get update > /dev/null && \
    sudo apt-get install -y -qq \
    mpv \
    konsole \
    inotify-tools \
    gphoto2
fi
