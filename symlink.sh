#!/bin/sh

# this is just so that I don't have to home-manager switch
# when working on these configs

remove() {
  rm -rf ~/.config/ags
  rm -rf ~/.config/nvim
}

symlink() {
  ln -s ~/Projects/dotfiles/home/features/desktop/hyprland/ags/config ~/.config/ags
  ln -s ~/Projects/dotfiles/home/features/nvim/config ~/.config/nvim
}

remove

if ! [[ $1 == 'remove' ]]; then
  symlink
else
  remove
fi
