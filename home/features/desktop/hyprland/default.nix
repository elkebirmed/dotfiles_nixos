{ pkgs, inputs, config, lib, ... }: {
  imports = [
    ../wallpapers
    ./packages.nix
    ./gtk.nix
    ./wofi.nix
    ./ags
    ./swaylock.nix
  ];

  home.file = {
    ".config/hypr/config" = {
      source = ./config;
      recursive = true;
    };

    ".config/hypr/scripts/wallpaper.sh".source = ./scripts/wallpaper.sh;
  };

  programs.pywal.enable = lib.mkDefault true;

  services.playerctld.enable = lib.mkDefault true;
  services.dunst.enable = lib.mkDefault true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = lib.mkDefault true;
    systemd.enable = lib.mkDefault true;
  };

  wayland.windowManager.hyprland.settings = {
    source = "/home/mohamed/.config/hypr/config/main.conf";
  };
}
