{ config, lib, pkgs, inputs, ... }:

{
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  services.power-profiles-daemon = {
    enable = true;
  };

  security.polkit.enable = true;

  services = {
    dbus.packages = [pkgs.gcr];
    geoclue2.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
