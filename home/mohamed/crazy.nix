{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../features/cli
    ../features/nvim
    ../features/desktop/wallpapers.nix
    ../features/desktop/hyprland
    ../features/desktop/programs/misc.nix
    ../features/desktop/programs/alacritty.nix
    ../features/desktop/programs/firefox.nix
    ../features/desktop/programs/vscode.nix
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
