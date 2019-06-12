#!/bin/bash

# install deps

echo '#######################'
echo 'installing base applications'
echo '#######################'
brew install --upgrade \
  zsh \
  vim \
  fzf \
  the_silver_searcher \
  fd

echo '#######################'
echo 'installing development and util applications'
echo '#######################'
brew install --upgrade \
  neofetch \
  htop \
  yarn


# install docker/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER

