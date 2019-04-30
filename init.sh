#!/bin/bash


# apply config
rm -f \
  ~/.xinitrc \
  ~/.xprofile \
  ~/.Xresources \
  ~/.gitconfig \
  ~/.zshrc

git clone https://github.com/zbaylin/rofi-wifi-menu.git ~/.config/scripts/rofi-wifi-menu
cp -rf --symbolic-link $(pwd)/.config/* ~/.config/
cp -rf --symbolic-link $(pwd)/.xresources/* ~/.xresources/
cp -rf --symbolic-link $(pwd)/.themes/* ~/.themes/

# copy custom omzsh scripts if omzsh exists
[ -d "$HOME/.oh-my-zsh" ] && cp -rf --symbolic-link $(pwd)/.oh-my-zsh/* ~/.oh-my-zsh/
ln -s $(pwd)/.xinitrc ~/.xinitrc
ln -s $(pwd)/.xprofile ~/.xprofile
ln -s $(pwd)/.Xresources ~/.Xresources
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.ignore ~/.ignore


# set up zsh
touch ~/.zs
touch ~/.zsh-update
touch ~/.zsh-history

ln -s $(pwd)/.zshrc ~/.zshrc

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
