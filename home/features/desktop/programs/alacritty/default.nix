{ ... }: {
  programs.alacritty = {
    enable = true;

  };

  home.file.".config/alacritty/alacritty.yml".source = ./config/alacritty.yml;
}
