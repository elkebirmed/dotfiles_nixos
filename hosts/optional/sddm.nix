{ config, lib, pkgs, inputs, ... }:

{
  services.xserver = {
    displayManager.lightdm.enable = lib.mkDefault false;
    
    displayManager.sddm = {

      enable = lib.mkDefault true;
      autoNumlock = lib.mkDefault true;
      wayland.enable = lib.mkDefault true;
      theme = lib.mkDefault "sugar-catppuccin";

      settings = {
        autologin = {
          Session = lib.mkDefault "hyprland";
        };
      };
    };
  };

  services.xserver.displayManager.sessionPackages = [ pkgs.hyprland ];

  environment.systemPackages = with pkgs; [
    inputs.sddm-sugar-catppuccin.packages.${pkgs.system}.default
  ];
}
