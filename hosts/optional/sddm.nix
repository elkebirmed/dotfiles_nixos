{ config, lib, pkgs, inputs, ... }:

{
  services.xserver = {
    displayManager.lightdm.enable = false;
    
    displayManager.sddm = {

      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      # theme = "sugar-catppuccin";

      settings = {
        autologin = {
          Session = "hyprland";
        };
      };
    };
  };

  services.xserver = {
    enable = true;
    layout = "fr";
    xkbVariant = "";
  };
}
