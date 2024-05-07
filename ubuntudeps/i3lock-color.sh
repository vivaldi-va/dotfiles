#!/bin/bash

set -e

trap cleanup EXIT
REPO=Raymo111/i3lock-color
LATEST_VERSION=$(curl -sL api.github.com/repos/$REPO/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
FILENAME=i3lock
URL=https://github.com/$REPO/releases/download/${LATEST_VERSION}/${FILENAME}

function cleanup {
  rm -rf /tmp/$FILENAME
}

curl -sL ${URL} -o /tmp/${FILENAME}

chmod +x /tmp/$FILENAME
sudo mv /tmp/$FILENAME /usr/local/bin/
