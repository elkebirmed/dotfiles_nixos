{ config, pkgs, ... }:

{
  home.file = {
    ".config/wallpapers" = {
      source = ./images;
      recursive = true;
    };
  };
}