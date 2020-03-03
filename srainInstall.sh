#!/bin/bash

# install dependencies
sudo apt-get update > /dev/null
sudo apt-get install -y \
  pkg-config \
  gettext \
  libgtk-3-dev \
  libsoup2.4-dev \
  libconfig-dev \
  libssl-dev \
  libsecret-1-dev \
  libconfig-dev

sudo apt-get install -y \
  glib-networking \
  libgtk3.0 \
  libsoup2.4 \
  libconfig9 \
  libsecret-1-0

INSTALL_DIR=/tmp/srain

rm -rf $INSTALL_DIR
git clone https://github.com/SrainApp/srain.git $INSTALL_DIR && cd $INSTALL_DIR

./configure \
  --prefix=/usr/local \
  --datadir=/usr/local/share \
  --sysconfdir=/etc

make && sudo make install

rm -rf $INSTALL_DIR
