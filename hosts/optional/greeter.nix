{ config, lib, pkgs, inputs, ... }:

{
  programs.regreet = {
    enable = true;
  };

  services.greetd = {
    enable = true;
  };

  services.xserver = {
    enable = true;
    layout = "fr";
    xkbVariant = "";
    displayManager.lightdm.enable = false;
  };
}
