#!/bin/bash

sudo add-apt-repository ppa:sile-typesetter/sile
sudo apt-get update > /dev/null
sudo apt-get install -y -qq sile
