{ config, pkgs, ... }:

{
  home.file = {
    ".config/wallpapers/images" = {
      source = ./images;
      recursive = true;
    };

    ".config/wallpapers/videos" = {
      source = ./videos;
      recursive = true;
    };

  };
}
