#!/bin/bash

source ./Scripts/isWsl.sh
machine=$(./Scripts/machine.sh)

# apply config
rm -f \
  ~/.xinitrc \
  ~/.xprofile \
  ~/.Xresources \
  ~/.gitconfig \
  ~/.zshrc

git clone https://github.com/zbaylin/rofi-wifi-menu.git ~/.config/scripts/rofi-wifi-menu
cp -rf --symbolic-link $(pwd)/.config/* ~/.config/
cp -rf --symbolic-link $(pwd)/.ssh/* ~/.ssh/
if [ $machine = 'Linux' ]; then
  cp -rf --symbolic-link $(pwd)/.themes/* ~/.themes/
fi

if is_wsl; then
  # forward docker port fron windows host
  echo 'wsl'
fi

[ -d "$HOME/.irssi" ] && mkdir -p ~/.irssi
cp -rf --symbolic-link $(pwd)/.irssi/* ~/.irssi/

# copy custom omzsh scripts if omzsh exists
[ -d "$HOME/.oh-my-zsh" ] && cp -rf --symbolic-link $(pwd)/.oh-my-zsh/* ~/.oh-my-zsh/
if [ $machine = 'Linux' ]; then
  ln -sf $(pwd)/.xinitrc ~/.xinitrc
  ln -sf $(pwd)/.xprofile ~/.xprofile
  ln -sf $(pwd)/.Xresources ~/.Xresources
fi
ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.ignore ~/.ignore
ln -sf $(pwd)/.yarnrc ~/.yarnrc


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf $(pwd)/.tmux.conf ~/.tmux.conf

if [ -d "$HOME/Dropbox" ]; then
  touch $HOME/Dropbox/note.txt
  ln -sf $HOME/Dropbox/note.txt $HOME/note.txt
fi


# set up zsh
touch ~/.zs
touch ~/.zsh-update
touch ~/.zsh-history

ln -sf $(pwd)/.zshrc ~/.zshrc

# install oh-my-zsh
#rm -rf ~/.oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# restore zshrc
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

# set up vim/neovim
mkdir -p ~/.config/nvim
mkdir -p ~/.config/vim/backup_files
mkdir -p ~/.config/vim/undo_files
git clone https://github.com/vivaldi-va/nvim-config.git ~/.config/nvim/

# install node js and utils
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
