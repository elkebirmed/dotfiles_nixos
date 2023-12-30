{ pkgs, ... }:

{
  home.packages = [
    pkgs.eww-wayland
  ];

  home.file.".config/eww" = {
    source = ./config;
    recursive = true;
  };
}
