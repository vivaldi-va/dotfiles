#!/bin/bash

set -e

wget -P /tmp/aurga https://github.com/aurgatech/linux-binaries/raw/main/OpenGL3/AURGAViewer
chmod +x /tmp/aurga/AURGAViewer

sudo mv /tmp/aurga/AURGAViewer /usr/local/bin

# set udev rules to allow userland input permissions
echo 'KERNEL=="event*", SUBSYSTEM=="input", MODE="0666", GROUP="input"' > sudo tee /etc/udev/rules.d/99-input-permissions.rules

# apply udev rules
sudo udevadm control --reload-rules && \
  sudo udevadm trigger
