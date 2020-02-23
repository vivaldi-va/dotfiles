#!/bin/bash

[ ! -d "$HOME/Drive" ] && mkdir $HOME/Drive

/usr/bin/rclone copy \
  --verbose \
  --transfers 30 \
  --checkers 8 \
  --contimeout 60s \
  --timeout 300s \
  --retries 3 \
  --low-level-retries 10 \
  --stats 1s \
  "google-drive:Sync" \
  "$HOME/Drive"


/usr/bin/rclone sync \
  --verbose \
  --transfers 30 \
  --checkers 8 \
  --contimeout 60s \
  --timeout 300s \
  --retries 3 \
  --low-level-retries 10 \
  --stats 1s \
  --copy-links \
  "$HOME/Drive" \
  "google-drive:Sync"

