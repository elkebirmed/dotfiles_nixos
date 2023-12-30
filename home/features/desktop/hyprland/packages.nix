{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    pulseaudio
    gtk3
    socat
  ];
}
