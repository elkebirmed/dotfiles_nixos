{ config, pkgs, inputs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.qogir-theme;
      name = "Qogir";
    };

    iconTheme = {
      name = "Zafiro-icons-Dark";
      package = pkgs.zafiro-icons;
    };

    font = {
      name = "Fira Sans";
      size = 11;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "Qogir";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.qogir-icon-theme;
    name = "Qogir";
    size = 16;
  };
}
