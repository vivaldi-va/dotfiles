#!/bin/sh

# install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# remove mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install neovim
brew tap neovim/neovim && brew install neovim

# install powerline fonts
git clone https://github.com/powerline/fonts.git ~/powerline-fonts && \
	cd ~/powerline-fonts && \
	./install.sh && \
	rm -rf ~/powerline-fonts

# change default screenshot location
screenshot_dir=~/Pictures/screenshots
mkdir -p $screenshot_dir
defaults write com.apple.screencapture location $screenshot_dir
