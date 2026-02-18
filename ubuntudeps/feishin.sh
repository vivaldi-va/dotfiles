#!/bin/bash

set -xe


LATEST_GH=$(curl -sL api.github.com/repos/jeffvli/feishin/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')

DEB_URL=https://github.com/jeffvli/feishin/releases/download/v${LATEST_GH}/Feishin-linux-amd64.deb

DEB_PATH=/tmp/Feishin-linux-amd64.deb

trap cleanup EXIT

function cleanup {
  rm -f /tmp/Feishin-linux-amd64.deb
}

curl -sL ${DEB_URL} -o ${DEB_PATH}
sudo dpkg -i ${DEB_PATH}
