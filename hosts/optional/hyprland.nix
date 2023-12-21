{ config, lib, pkgs, inputs, ... }:

{
  security.pam.services.swaylock = {};
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
  xdg.portal.configPackages = [ inputs.hyprland.hyprland ];
  xdg.portal.enable = lib.mkDefault true;
}
