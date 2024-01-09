{ pkgs, inputs, ... }:
let
  gtk-theme = "adw-gtk3-dark";
  icon-theme = "Papirus";

  cursor-theme = "Qogir";
  cursor-package = pkgs.qogir-icon-theme;

  nerdfonts = (pkgs.nerdfonts.override { fonts = [
    "Ubuntu"
    "UbuntuMono"
    "CascadiaCode"
    "FantasqueSansMono"
    "FiraCode"
    "Mononoki"
    "JetBrainsMono"
  ]; });
in
{
  home = {
    packages = with pkgs; [
      font-awesome
      papirus-icon-theme
      qogir-icon-theme
      whitesur-icon-theme
      colloid-icon-theme
      adw-gtk3
      nerdfonts
    ];

    sessionVariables = {
      XCURSOR_THEME = cursor-theme;
      XCURSOR_SIZE = "16";
      GTK_THEME = gtk-theme;
    };

    pointerCursor = {
      package = cursor-package;
      name = cursor-theme;
      size = 16;
      gtk.enable = true;
    };

    file = {
      ".local/share/fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
      ".fonts" = {
        recursive = true;
        source = "${nerdfonts}/share/fonts/truetype/NerdFonts";
      };
      ".config/gtk-4.0/gtk.css" = {
        text = ''
          window.messagedialog .response-area > button,
          window.dialog.message .dialog-action-area > button,
          .background.csd{
            border-radius: 0;
          }
        '';
      };
    };
  };

  gtk = {
    enable = true;
    font.name = "Roboto";
    theme.name = gtk-theme;
    cursorTheme = {
      name = cursor-theme;
      package = cursor-package;
    };
    iconTheme.name = icon-theme;
    gtk3.extraCss = ''
      headerbar, .titlebar,
      .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
        border-radius: 0;
      }
    '';
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "adwaita-dark";
  };
}
