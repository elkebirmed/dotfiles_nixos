{ pkgs, inputs, config, lib, ... }: {
  programs.alacritty = {
    enable = true;
  };
  
  home.sessionVariables.TERMINAL = "${config.programs.alacritty.package}/bin/alacritty";
}
