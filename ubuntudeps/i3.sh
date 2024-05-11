#!/bin/bash

sudo apt-get update > /dev/null && \
  sudo apt-get install -y -qq \
    i3 \
    picom \
    hsetroot \
    rxvt-unicode \
    xsel \
    rofi \
    fonts-noto \
    fonts-mplus \
    xsettingsd \
    lxappearance \
    scrot \
    viewnior \
    brightnessctl

./i3lock-color.sh

# install betterlockscreen
wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh \
  -O - -q | \
  bash -s user
