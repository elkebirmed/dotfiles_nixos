{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pulseaudio
    gtk3
    libnotify
    wl-gammactl
    wl-clipboard
    wf-recorder
    hyprpicker
    wayshot
    swappy
    slurp
    imagemagick
    pavucontrol
    brightnessctl
    swww
    eww-wayland
  ];
}
