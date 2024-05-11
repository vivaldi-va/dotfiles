#!/bin/bash

git clone https://github.com/deter0/xborder /tmp/xborder
cd /tmp/xborder
chmod +x xborders
pip3 install -r requirements.txt

sudo mv /tmp/xborder/xborders /usr/local/bin

rm -rf /tmp/xborder
