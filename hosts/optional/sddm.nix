{ config, lib, pkgs, inputs, ... }:

{
  services.xserver = {
    displayManager.lightdm.enable = false;
    
    displayManager.sddm = {

      enable = true;
      autoNumlock = true;
      wayland.enable = true;
      theme = "sugar-catppuccin";

      settings = {
        autologin = {
          Session = "hyprland";
        };
      };
    };
  };

  services.xserver.displayManager.sessionPackages = [ pkgs.hyprland ];

  environment.systemPackages = with pkgs; [
    inputs.sddm-sugar-catppuccin.packages.${pkgs.system}.default
  ];
}
