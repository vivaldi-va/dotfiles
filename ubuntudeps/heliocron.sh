#!/bin/bash

set -e
REPO=mfreeborn/heliocron

LATEST_GH=$(curl -sL api.github.com/repos/${REPO}/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
FILE_NAME=heliocron-v${LATEST_GH}-x86_64-unknown-linux-gnu.tar.gz
REPO_URL=https://github.com/${REPO}/releases/download/v${LATEST_GH}/${FILE_NAME}

curl -sL ${REPO_URL} -o ./${FILE_NAME}
mkdir heliocron
tar xzvf ${FILE_NAME} -C heliocron --strip-components 1
rm ${FILE_NAME}
sudo mv ./heliocron/heliocron /usr/local/bin/heliocron
rm -rf ./heliocron

#https://github.com/mfreeborn/heliocron/releases/download/v0.5.0/heliocron-v0.5.0-x86_64-unknown-linux-gnu.tar.gz
