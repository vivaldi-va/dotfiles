#!/bin/bash

source ./Scripts/getDistro.sh
machine=$(./Scripts/machine.sh)

echo "Initializing dotfiles..."
echo "Environment: $OS"

# apply config
rm -f \
  ~/.xinitrc \
  ~/.xprofile \
  ~/.Xresources \
  ~/.gitconfig \
  ~/.zshrc

# use coreutils cp if on mac
if [[ $OS == 'Darwin' ]]; then
  copy=gcp
else
  copy=cp
fi

# symlink .config directory and contents to $HOME/.config
$copy -rf --symbolic-link $(pwd)/.config/* ~/.config/

# symlink .local directory and contents to $HOME/.local
$copy -rf --symbolic-link $(pwd)/.local/* ~/.local/

$copy -rf --symbolic-link $(pwd)/.ssh/* ~/.ssh/

# copy x files for arch theme etc.
if [[ $OS == 'Arch Linux' ]]; then
  ln -sf $(pwd)/.xinitrc ~/.xinitrc
  ln -sf $(pwd)/.xprofile ~/.xprofile
  ln -sf $(pwd)/.Xresources ~/.Xresources
  [ ! -d "$HOME/.config/rofi/themes/gruvbox" ] && \
    git clone https://github.com/vivaldi-va/gruvbox-rofi ~/.config/rofi/themes/gruvbox
  [ ! -d "$HOME/.config/scripts/rofi-wifi-menu" ] && \
    git clone https://github.com/zbaylin/rofi-wifi-menu.git ~/.config/scripts/rofi-wifi-menu
  [ ! -d "$HOME/.config/scripts/rofi-power-menu" ] && \
    git clone https://github.com/vivaldi-va/rofi-power-menu.git ~/.config/scripts/rofi-power-menu

  sudo chmod a+wr /opt/spotify
  sudo chmod a+wr /opt/spotify/Apps -R

  spicetify && \
  spicetify config current_theme gruvbox && \
  spicetify backup apply enable-devtool

fi

ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.ignore ~/.ignore

# tmux config
[ ! -d "$HOME/.tmux/plugins/tpm" ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf

## use OS-specific config overrides, setting correct theme etc
## e.g. arch uses theme configured for Wal
[ "$(lsb_release -si)" != "Arch" ] && ln -sf $(pwd)/.tmux.conf.default ~/.tmux.conf.local
[ "$(lsb_release -si)" = "Arch" ] && ln -sf $(pwd)/.tmux.conf.arch ~/.tmux.conf.local

# set up dropbox-stored note taking
if [ -d "$HOME/Drive" ]; then
  touch $HOME/Drive/note.txt
  ln -sf $HOME/Drive/note.txt $HOME/note.txt
fi

# copy scripts
sudo $copy -rf --symbolic-link $(pwd)/Scripts/* /usr/local/bin/

# Crontabs (only non-mac OS)
#if [[ $OS != 'Darwin' ]];then
#  sudo touch /var/log/cron.log
#  sudo $copy -rf --symbolic-link $(pwd)/cron/* /etc/cron.d/
#fi


# set up zsh

# change default shell to zsh
chsh -s /usr/bin/zsh

# install omzsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

## restore zshrc
[ -f ~/.zshrc.pre-oh-my-zsh ] && mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
touch ~/.zs
touch ~/.zsh-update
touch ~/.zsh-history

## copy custom omzsh scripts if omzsh exists
#[ ! -d "$HOME/.oh-my-zsh" ] && mkdir $HOME/.oh-my-zsh
$copy -rf --symbolic-link $(pwd)/.oh-my-zsh/* ~/.oh-my-zsh/
ln -sf $(pwd)/.zshrc ~/.zshrc

# set up vim/neovim
mkdir -p ~/.config/nvim
mkdir -p ~/.config/vim/backup_files
mkdir -p ~/.config/vim/undo_files
[ ! -d "$HOME/.config/nvim" ] && git clone https://github.com/vivaldi-va/nvim-config.git ~/.config/nvim/

# install node js and utils
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.3/install.sh | bash
fi

# copy bin directory
sudo $copy -rf --symbolic-link $(pwd)/bin/* /usr/local/bin

echo "Init complete"
