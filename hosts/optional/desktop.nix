{ config, lib, pkgs, inputs, ... }:

{
  services.xserver = {
    enable = lib.mkDefault true;
    layout = lib.mkDefault "fr";
    xkbVariant = lib.mkDefault "";
  };
  
  hardware.opengl.enable = lib.mkDefault true;

  services.printing.enable = lib.mkDefault true;

  programs = {
    adb.enable = lib.mkDefault true;
    kdeconnect.enable = lib.mkDefault true;
    dconf.enable = lib.mkDefault true;
  };
}
