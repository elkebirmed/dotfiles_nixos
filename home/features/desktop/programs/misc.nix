{ pkgs, inputs, config, lib, ... }: {
  home.packages = with pkgs; [
    xfce.thunar
  ];
}