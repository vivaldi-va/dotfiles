#!/bin/bash

# install deps

echo '#######################'
echo 'installing base applications'
echo '#######################'
packer -S --noconfirm --noedit \
  zsh \
  pulseaudio-alsa \
  compton \
  rofi \
  dunst \
  python-pywal \
  polybar \
  rxvt-unicode \
  vim \
  neovim \
  fzf \
  the_silver_searcher \
  fd-find \
  redshift \
  w3m

echo '#######################'
echo 'installing development and util applications'
echo '#######################'
packer -S --noconfirm --noedit \
  neofetch \
  htop \
  libinput \
  libinput-gestures \
  betterlockscreen \
  yarn \
  docker


# install docker/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER

echo '#######################'
echo 'installing additional applications'
echo '#######################'
packer -S --noconfirm --noedit \
  chromium \
  chromium-dev \
  google-chrome \
  google-chrome-dev \
  mailspring \
  libcurl-gnutls spotify \
  slack-desktop \
  dropbox \
  vlc

