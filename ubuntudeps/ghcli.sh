#!/bin/bash

set -x

LATEST_GH=$(curl -sL api.github.com/repos/cli/cli/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
echo $LATEST_GH
GH_CLI_URL=https://github.com/cli/cli/releases/download/v${LATEST_GH}/gh_${LATEST_GH}_linux_amd64.deb
echo $GH_CLI_URL

curl -sL ${GH_CLI_URL} -o ./gh_${LATEST_GH}_linux_amd64.deb
sudo dpkg -i gh_${LATEST_GH}_linux_amd64.deb
rm gh_${LATEST_GH}_linux_amd64.deb
