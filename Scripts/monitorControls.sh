#!/bin/bash

# TODO:
# * https://github.com/mfreeborn/heliocron
# * get list of monitors
# * operate on all found monitors when applying settings
# * set up cron

set +x

SUN_UP=$1

#DISPLAY_IDS=$(sudo ddcutil detect | awk '$1 ~ /Display/ { printf "%s\n\r", $2 }')
display_ids() {
  sudo ddcutil detect | awk '$1 ~ /Display/ { printf "%s\n\r", $2 }'
}

set_day() {
  echo -e "configuring display $1\n"
  sudo ddcutil --display $1 setvcp 10 30
  sudo ddcutil --display $1 setvcp 1a 100
  sudo ddcutil --display $1 setvcp 18 100
  sudo ddcutil --display $1 setvcp 16 100
}

set_night() {
  echo -e "configuring display $1\n"
  sudo ddcutil --display $1 setvcp 10 20
  sudo ddcutil --display $1 setvcp 1a 43
  sudo ddcutil --display $1 setvcp 18 69
  sudo ddcutil --display $1 setvcp 16 100
}

if [[ $SUN_UP -eq 1 ]]; then
  echo -e "day time\n"
  display_ids | while read display; do
    set_day $display
  done
  # Daytime - Set brightness to 50% and color temperature to 6500K
else
  echo -e "night time"
  display_ids | while read display; do
    set_night $display
  done
fi

wait

echo -e "done"
