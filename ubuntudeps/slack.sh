#!/bin/bash

version=4.29.149
curl -sL \
  https://downloads.slack-edge.com/releases/linux/${version}/prod/x64/slack-desktop-${version}-amd64.deb -o /tmp/slack.deb

sudo dpkg -i /tmp/slack.deb

rm /tmp/slack.deb
