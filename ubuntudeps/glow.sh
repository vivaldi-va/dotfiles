#!/bin/bash

set -x

REPO=charmbracelet/glow

LATEST_GH=$(curl -sL api.github.com/repos/${REPO}/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
echo $LATEST_GH
FILE_NAME=glow_${LATEST_GH}_linux_amd64.deb
REPO_URL=https://github.com/${REPO}/releases/download/v${LATEST_GH}/${FILE_NAME}

curl -sL ${REPO_URL} -o ./${FILE_NAME}
sudo dpkg -i $FILE_NAME
rm $FILE_NAME
