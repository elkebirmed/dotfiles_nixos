{ pkgs, inputs, ... }: {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];
}
