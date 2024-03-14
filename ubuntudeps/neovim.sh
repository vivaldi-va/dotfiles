#!/bin/bash

echo Installing NeoVIM
curl -sL https://github.com/neovim/neovim/releases/latest/download/nvim.appimage > /tmp/nvim.appimage && \
  sudo mv /tmp/nvim.appimage /usr/local/bin/nvim && \
  chmod u+x /usr/local/bin/nvim

# python support
echo Installing NeoVIM Python support
# pip3 install pynvim
sudo apt install python3-pynvim
