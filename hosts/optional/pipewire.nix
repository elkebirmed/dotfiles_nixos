{ config, lib, pkgs, inputs, ... }:

{
  sound.enable = lib.mkDefault true;
  hardware.pulseaudio.enable = lib.mkDefault false;

  services.power-profiles-daemon = {
    enable = lib.mkDefault true;
  };

  security.polkit.enable = lib.mkDefault true;

  services = {
    dbus.packages = [pkgs.gcr];
    geoclue2.enable = lib.mkDefault true;

    pipewire = {
      enable = lib.mkDefault true;
      alsa.enable = lib.mkDefault true;
      alsa.support32Bit = lib.mkDefault true;
      pulse.enable = lib.mkDefault true;
      jack.enable = lib.mkDefault true;
    };
  };
}
