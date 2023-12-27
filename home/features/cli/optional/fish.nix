{ pkgs, config, lib, ... }:

{
  programs.alacritty = {
    settings = {
      shell = {
        program = lib.mkDefault "${config.programs.fish.package}/bin/fish";
      };
    };
  };

  programs.fish = {
    enable = true;
  };
}