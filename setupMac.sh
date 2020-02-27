#!/bin/sh

# remove mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# change default screenshot location to $HOME/Pictures/screenshots
screenshot_dir=~/Pictures/screenshots
mkdir -p $screenshot_dir
defaults write com.apple.screencapture location $screenshot_dir

# disable airdrop
defaults write com.apple.NetworkBrowser DisableAirDrop -bool YES

# disable remote disk
sudo defaults write /Library/Preferences/com.apple.NetworkBrowser EnableODiskBrowsing -bool false

# stop generating .DS_Store files
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

#copy launctl agents
sudo cp -rf $(pwd)/osx/LaunchAgents/* /Library/LaunchAgents/
