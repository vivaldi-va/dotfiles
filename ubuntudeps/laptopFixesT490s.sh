#!/bin/bash

# xfce4 screensaver causes conflicts and can
# freeze the session
sudo apt-get remove xfce4-screensaver

sudo apt-get update > /dev/null && \
  sudo apt-get install -y -qq \
    light-locker


# update firmware
# should (hopefully) prevent issues such as
# excessively throttled CPU
sudo fwupdmgr update
