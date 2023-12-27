{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ../features/cli
    ../features/optional/fish.nix

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

  programs.git = {
    enable = true;
    userName = "Mohamed Elkebir";
    userEmail = "mohamedelkebir85@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";

      credential.helper = "!gh auth git-credential";
    };
  };

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
