{ config, lib, pkgs, inputs, ... }:

{
  security.pam.services.swaylock = {};
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  configPackages = [ inputs.hyprland.hyprland ];
  xdg.portal.enable = lib.mkDefault true;
}
