#!/bin/bash

# Deps
sudo apt-get update > /dev/null
sudo apt-get install -y -qq gtk2-engines-murrine gtk2-engines-pixbuf

mkdir -p /tmp/theme

# Theme
FILE_NAME=qogir-theme.zip

curl -sL \
  https://github.com/vinceliuice/Qogir-theme/archive/master.zip \
  -o /tmp/theme/${FILE_NAME}

cd /tmp/theme
unzip -o ${FILE_NAME}
cd Qogir-theme-master
./install.sh -c dark -t default

# Icons
FILE_NAME=qogir-icon-theme.zip

curl -sL \
  https://github.com/vinceliuice/Qogir-icon-theme/archive/master.zip \
  -o /tmp/theme/${FILE_NAME}

cd /tmp/theme
unzip -o ${FILE_NAME}
cd Qogir-icon-theme-master
./install.sh

rm -rf /tmp/theme

# apply
xfconf-query -c xsettings -p /Net/ThemeName -s "Qogir-Dark"
xfconf-query -c xfwm4 -p /general/theme -s Qogir-Dark
