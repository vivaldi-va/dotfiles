#!/bin/bash

sudo apt-get update > /dev/null && \
  sudo apt-get install -y -qq \
    jq \
    curl \
    git \
    zsh \
    vim \
    silversearcher-ag \
    tmux \
    ranger \
    pandoc \
    autoconf \
    autotools-dev \
    build-essential \
    fuse libfuse2 \
    rdate \
    # alternate git diff
    git-delta

./ubuntudeps/neovim.sh
./ubuntudeps/fd.sh
./ubuntudeps/ctag.sh
./ubuntudeps/ghcli.sh
#./ubuntudeps/sile.sh
#./ubuntudeps/weechat.sh

# install xfce theme
if [[ $DISPLAY ]]; then
  ./ubuntudeps/qogir-theme.sh
fi

# install desktop-only stuff
if [[ $DISPLAY ]]; then
  #./ubuntudeps/rofi.sh
  ./ubuntudeps/glow.sh
  ./ubuntudeps/chrome.sh
  ./ubuntudeps/iosevka.sh
  ./ubuntudeps/spotify.sh

  sudo apt-get update > /dev/null && \
    sudo apt-get install -y -qq \
    mpv \
    konsole \
    inotify-tools \
    gphoto2 \
    font-manager \
    vim-gtk3 \
    rofi \
    # redshift alternative
    gammastep \
    # make sure bt headphones work
    # https://askubuntu.com/a/471333
    pulseaudio-module-bluetooth
fi
