{ pkgs, lib, config, inputs, ... }:
{
  services.xserver = {
    enable = true;
    layout = "fr";
    xkbVariant = "";
    displayManager.lightdm.enable = false;

    displayManager.sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
        theme = "sugar-catppuccin";

        settings = {
          autologin = {
            Session = "hyprland";
            User = "mohamed";
          };
        };
      };
  };

  environment.systemPackages = with pkgs; [
    inputs.sddm-sugar-catppuccin.packages.${pkgs.system}.default
  ];
}
