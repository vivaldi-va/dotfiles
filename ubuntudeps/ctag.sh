#!/bin/bash

set -e

echo Install universal ctags
git clone https://github.com/universal-ctags/ctags.git /tmp/ctags
sudo chown -R `whoami` /tmp/ctags
cd /tmp/ctags
./autogen.sh
./configure
make
sudo make install
echo Done install
rm -rf /tmp/ctags
