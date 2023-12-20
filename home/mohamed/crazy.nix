{ inputs, outputs, ... }: {
  imports = [
    ./global
    ./features/desktop/hyprland
  ];

  colorscheme = inputs.nix-colors.colorschemes.paraiso;
  wallpaper = outputs.wallpapers.cyberpunk-city-red;

  monitors = [
    {
      name = "DP-1";
      width = 1366;
      height = 768;
      x = 0;
      workspace = "1";
      primary = true;
    }
  ];
}