#!/bin/bash

set -x

LATEST_GH=$(curl -sL api.github.com/repos/getsops/sops/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
BIN_NAME=sops_${LATEST_GH}_amd64.deb
echo $LATEST_GH
GH_URL=https://github.com/getsops/sops/releases/download/v${LATEST_GH}/${BIN_NAME}
echo $GH_URL


curl -sL ${GH_URL} -o ./${BIN_NAME}
sudo dpkg -i ${BIN_NAME}
rm ${BIN_NAME}
