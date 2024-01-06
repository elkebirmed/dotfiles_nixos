#!/bin/sh

# this is just so that I don't have to home-manager switch
# when working on these configs

remove() {
  rm -rf ~/.config/ags
  rm -rf ~/.config/nvim
  rm -rf ~/.config/hypr/config
  # rm -rf ~/.config/eww
}

symlink() {
  ln -s ~/Projects/dotfiles/home/features/desktop/hyprland/ags/config ~/.config/ags
  ln -s ~/Projects/dotfiles/home/features/nvim/config ~/.config/nvim
  ln -s ~/Projects/dotfiles/home/features/desktop/hyprland/config ~/.config/hypr/config
  # ln -s ~/Projects/dotfiles/home/features/desktop/hyprland/eww/config ~/.config/eww
}

remove

if ! [[ $1 == 'remove' ]]; then
  symlink
else
  remove
fi
