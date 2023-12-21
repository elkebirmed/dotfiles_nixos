{ config, lib, pkgs, inputs, ... }:
let
  homeCfgs = config.home-manager.users;
  homeSharePaths = lib.mapAttrsToList (n: v: "${v.home.path}/share") homeCfgs;
  vars = ''XDG_DATA_DIRS="$XDG_DATA_DIRS:${lib.concatStringsSep ":" homeSharePaths}"'';

  misterioCfg = homeCfgs.misterio;
  gtkTheme = misterioCfg.gtk.theme;
  iconTheme = misterioCfg.gtk.iconTheme;
  wallpaper = misterioCfg.wallpaper;

  sway-kiosk = command: "${lib.getExe pkgs.sway} --config ${pkgs.writeText "kiosk.config" ''
    output * bg #000000 solid_color
    xwayland disable
    input "type:touchpad" {
      tap enabled
    }
    exec 'GTK_USE_PORTAL=0 ${vars} ${command}; ${pkgs.sway}/bin/swaymsg exit'
  ''}";
in
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
