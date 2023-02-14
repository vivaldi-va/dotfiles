#!/bin/bash

git clone https://github.com/medusalix/xone

cd xone
sudo ./install.sh --release

sudo xone-get-firmware.sh --skip-disclaimer

rm -rf xone
