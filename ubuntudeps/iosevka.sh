#!/bin/bash

if [ ! -d "$HOME/.fonts" ]; then
  mkdir -p ~/.fonts
fi

# https://github.com/be5invis/Iosevka/releases/download/v19.0.1/super-ttc-iosevka-19.0.1.zip

REPO=be5invis/Iosevka
LATEST_VERSION=$(curl -sL api.github.com/repos/${REPO}/releases/latest | jq .tag_name | sed 's/v//' | sed 's/"//g')
echo $LATEST_VERSION
#ARCHIVE_URL=https://github.com/${REPO}/releases/download/v${LATEST_VERSION}/super-ttc-iosevka-${LATEST_VERSION}.zip
ARCHIVE_URL=https://github.com/${REPO}/releases/download/v${LATEST_VERSION}/PkgTTC-Iosevka-${LATEST_VERSION}.zip

TEMP_DIR=/tmp/iosevka
mkdir -p $TEMP_DIR

curl -sL ${ARCHIVE_URL} -o ${TEMP_DIR}/iosevka.zip

cd $TEMP_DIR
unzip $TEMP_DIR/iosevka.zip -d $HOME/.fonts/

rm -rf $TEMP_DIR

fc-cache -fv
