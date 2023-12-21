{ config, lib, pkgs, inputs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "fr";
    xkbVariant = "";
  };
  
  hardware.opengl.enable = lib.mkDefault true;
  programs.dconf.enable = lib.mkDefault true;
}
