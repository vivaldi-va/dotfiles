#!/bin/bash

curl -sL https://vault.bitwarden.com/download/?app=desktop&platform=linux > /tmp/bitwarden.appimage

sudo mv /tmp/bitwarden.appimage /usr/local/bin/bitwarden
chmod u+x /usr/local/bin/bitwarden
