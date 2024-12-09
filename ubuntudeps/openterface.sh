#!/bin/bash

set -e

SRC_PATH=/tmp/openterface

# Build environment preparation
sudo apt-get update -y > /dev/null
sudo apt-get install -y \
    build-essential \
    qmake6 \
    qt6-base-dev \
    qt6-multimedia-dev \
    qt6-serialport-dev \
    qt6-svg-dev


trap cleanup EXIT

function cleanup {
  rm -rf $SRC_PATH
}

# Get the source
git clone https://github.com/TechxArtisanStudio/Openterface_QT.git $SRC_PATH
cd $SRC_PATH
mkdir build
cd build
qmake6 ..
make -j$(nproc)

sudo mv ./openterfaceQT /usr/local/bin/openterfaceQT
