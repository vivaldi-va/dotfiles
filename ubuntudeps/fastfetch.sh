#!/bin/bash

set -e

trap cleanup EXIT
REPO=fastfetch-cli/fastfetch
LATEST_VERSION=$(curl -sL api.github.com/repos/$REPO/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
FILENAME=fastfetch-linux-amd64.deb
URL=https://github.com/$REPO/releases/download/${LATEST_VERSION}/${FILENAME}

function cleanup {
  rm -rf /tmp/$FILENAME
}

curl -sL ${URL} -o /tmp/${FILENAME}

sudo dpkg -i /tmp/$FILENAME
rm /tmp/${FILENAME}
