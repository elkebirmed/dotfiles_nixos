{ pkgs, inputs, config, ... }: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 15;
      gaps_out = 20;
      border_size = 2.7;
      cursor_inactive_timeout = 4;
      "col.active_border" = "0xff${config.colorscheme.colors.base0C}";
      "col.inactive_border" = "0xff${config.colorscheme.colors.base02}";
    };

    group = {
      "col.border_active" = "0xff${config.colorscheme.colors.base0B}";
      "col.border_inactive" = "0xff${config.colorscheme.colors.base04}";
      groupbar = {
        font_size = 11;
      };
    };

    "$mod" = "SUPER";
    bind =
      [
        "$mod, F, exec, firefox"
        "$mod SHIFT, Q, exit"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };
}
