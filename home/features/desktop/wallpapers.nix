{ config, pkgs, ... }:

{
  programs.pywal.enable = true;

  home.file = {
    ".config/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
