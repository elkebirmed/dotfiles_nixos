{ config, lib, pkgs, inputs, ... }:

{
  services.xserver = {
    displayManager.lightdm.enable = false;
    
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

  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
  ];

  services.xserver = {
    enable = true;
    layout = "fr";
    xkbVariant = "";
  };
}
