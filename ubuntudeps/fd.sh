#!/bin/bash

LATEST_VERSION=$(curl -sL api.github.com/repos/sharkdp/fd/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
FILENAME=fd_${LATEST_VERSION}_amd64.deb
URL=https://github.com/sharkdp/fd/releases/download/v${LATEST_VERSION}/${FILENAME}

echo ${URL}

curl -sL ${URL} -o /tmp/fd.deb && \
  sudo dpkg -i --force-overwrite /tmp/fd.deb && \
  rm /tmp/fd.deb

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git /tmp/fzf \
  && /tmp/fzf/install \
  && rm -rf /tmp/fzf

