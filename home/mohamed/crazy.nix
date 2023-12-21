{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../features/cli
    ../features/desktop/hyprland
  ];

  home.username = "mohamed";
  home.homeDirectory = "/home/mohamed";
  home.stateVersion = "23.11";

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;

  home.shellAliases = {
    l = "eza";
    ls = "eza";
    cat = "bat";
  };
}
