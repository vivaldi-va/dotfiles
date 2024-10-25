#!/bin/bash

git clone https://github.com/medusalix/xone /tmp/xone

cd /tmp/xone
sudo ./install.sh --release

sudo xone-get-firmware.sh --skip-disclaimer

rm -rf /tmp/xone
