{ pkgs, config, ... }:

{
  programs.alacritty = {
    settings = {
      shell = {
        program = "${config.programs.fish.package}/bin/fish";
      };
    };
  };

  programs.fish = {
    enable = true;
  };
}