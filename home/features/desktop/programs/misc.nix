{ pkgs, inputs, config, lib, ... }: {
  home.packages = with pkgs; [
    xfce.thunar
    peazip
    google-chrome
    icon-library
    discord
  ];
}
