#!/bin/bash

set -e

function cleanup {
  rm -rf /tmp/btop
}

trap cleanup EXIT
LATEST_VERSION=$(curl -sL api.github.com/repos/aristocratos/btop/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
FILENAME=btop-x86_64-linux-musl.tbz
URL=https://github.com/aristocratos/btop/releases/download/v${LATEST_VERSION}/${FILENAME}

curl -sL ${URL} -o /tmp/${FILENAME}
#mkdir -p /tmp/btop && tar -xjf /tmp/${FILENAME} -C /tmp/btop
tar -xjf /tmp/${FILENAME} -C /tmp

cd /tmp/btop
sudo make install

rm /tmp/${FILENAME}
rm -rf /tmp/btop
