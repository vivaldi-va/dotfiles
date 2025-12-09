#!/bin/bash

set -e

function cleanup {
  rm /tmp/google-chrome.deb
  rm /tmp/google-chrome-dev.deb
}

trap cleanup EXIT
mkdir -p /tmp

wget -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -O /tmp/google-chrome-dev.deb https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb

sudo dpkg -i /tmp/google-chrome.deb
sudo dpkg -i /tmp/google-chrome-dev.deb

cleanup

#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#
#sudo apt update > /dev/null && \
#  sudo apt install -y -qq \
#    google-chrome-stable \
#    google-chrome-unstable
