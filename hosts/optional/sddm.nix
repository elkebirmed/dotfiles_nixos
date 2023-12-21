{ config, lib, pkgs, inputs, ... }:

{
  services.xserver = {
    displayManager.sddm = {
      lightdm.enable = false;

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
