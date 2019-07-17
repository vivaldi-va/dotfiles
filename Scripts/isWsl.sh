#!/bin/bash

version=$(uname -a)

function is_wsl() {
  if [[ $version =~ Microsoft ]]; then
    return
  fi

  false
}
