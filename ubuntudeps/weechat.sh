#!/bin/bash

# install deps
sudo apt-get install -y -qq \
  ca-certificates \
  dirmngr \
  gpg-agent \
  apt-transport-https

sudo mkdir /root/.gnupg && \
  sudo chmod 700 /root/.gnupg

sudo mkdir -p /usr/share/keyrings
sudo gpg \
  --no-default-keyring \
  --keyring /usr/share/keyrings/weechat-archive-keyring.gpg \
  --keyserver hkps://keys.openpgp.org \
  --recv-keys 11E9DE8848F2B65222AA75B8D1820DB22A11534E

echo "deb [signed-by=/usr/share/keyrings/weechat-archive-keyring.gpg] https://weechat.org/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/weechat.list
echo "deb-src [signed-by=/usr/share/keyrings/weechat-archive-keyring.gpg] https://weechat.org/ubuntu $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/weechat.list

sudo apt-get update > /dev/null && \
  sudo apt-get install -y -qq \
    weechat-curses \
    weechat-plugins \
    weechat-python \
    weechat-perl

