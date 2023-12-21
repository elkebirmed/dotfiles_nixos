{ config, lib, pkgs, inputs, ... }:

{
  services.xserver = {
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "sugar-catppuccin";

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
    displayManager.lightdm.enable = false;
  };
}
