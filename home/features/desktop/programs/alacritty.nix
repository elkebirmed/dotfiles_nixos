{ pkgs, inputs, config, lib, ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      
    };
  };
  
  home.sessionVariables.TERMINAL = "${config.programs.alacritty.package}/bin/alacritty";
}
