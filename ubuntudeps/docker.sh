#!/bin/bash

# install dependencies
 sudo apt-get update
 sudo apt-get install -y \
   ca-certificates \
   curl \
   gnupg

 # set up key ring and repository
sudo install -m 0755 -d /etc/apt/keyrings
curl \
  -fsSL \
  https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg \
    --dearmor \
    -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker engine
sudo apt-get update > /dev/null
sudo apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER
