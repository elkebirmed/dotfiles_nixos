{ pkgs, inputs, config, lib, ... }: {
  programs.alacritty = {
    enable = true;
  };
  
  home.sessionVariables.EDITOR = "${config.programs.alacritty.package}/bin/alacritty";
}
