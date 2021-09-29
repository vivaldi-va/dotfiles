#!/bin/bash

# install dependencies
sudo apt-get update && sudo apt-get install -y -qq \
  libxkbcommon-x11-dev \
  libxcb-util-dev \
  libxcb-icccm4-dev \
  libxcb-ewmh-dev \
  libxcb-cursor-dev \
  libxcb-randr0-dev \
  libxcb-xinerama0-dev \
  libstartup-notification0-dev \
  bison \
  flex

LATEST_TAG=$(curl -sL api.github.com/repos/davatorium/rofi/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
echo $LATEST_TAG
FILE_NAME=rofi-${LATEST_TAG}.tar.gz
GH_URL=https://github.com/davatorium/rofi/releases/download/${LATEST_TAG}/${FILE_NAME}


curl -sL ${GH_URL} -o ./${FILE_NAME}
tar xzvf ${FILE_NAME}
cd rofi-${LATEST_TAG}

mkdir build && cd build
../configure --disable-check && \
  make && \
  sudo make install

cd ../..
rm ${FILE_NAME}
rm -rf rofi-${LATEST_TAG}
