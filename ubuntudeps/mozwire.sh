#!/bin/bash

curl -sL https://github.com/NilsIrl/MozWire/releases/latest/download/mozwire-linux \
  -o /tmp/mozwire-linux

chmod +x /tmp/mozwire-linux
sudo mv /tmp/mozwire-linux /usr/local/bin/mozwire-linux
