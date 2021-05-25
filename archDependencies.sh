#!/bin/bash

# install deps

## update database
pacman -Syy

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
  fd \
  universal-ctags-git \
  redshift \
  w3m \
  maim \
  pulseaudio-ctl \
  tmux \
  unrar \
  p7zip \
  udisks2 \
  inotify-tools \
  cronie \
  rclone

echo '#######################'
echo 'installing development and util applications'
echo '#######################'
packer -S --noconfirm --noedit \
  neofetch \
  htop \
  libinput libinput-gestures \
  betterlockscreen \
  yarn \
  docker \
  weechat \
  ranger \
  github-cli

echo '#######################'
echo 'installing fonts'
echo '#######################'
packer -S --noconfirm --noedit \
  ttf-symbola \
  ttf-iosevka \
  ttf-fira-code

# install docker/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER

echo '#######################'
echo 'installing additional applications'
echo '#######################'
packer -S --noconfirm --noedit \
  firefox \
  chromium \
  chromium-dev \
  google-chrome \
  google-chrome-dev \
  libcurl-gnutls spotify \
  spicetify-cli \
  slack-desktop \
  dropbox \
  vlc \
  imgur-screenshot-git \
  sxiv \
  mpv \
  youtube-dl \
  mupdf jbig2dec \
  surf \
  zathura zathura-pdf-poppler
