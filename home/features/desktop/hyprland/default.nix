{ pkgs, inputs, config, lib, ... }: {
  imports = [
    ./wofi.nix
    ./ags.nix
    ./swww.nix
    ./swaylock.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.paraiso;

  home.packages = with pkgs; [
    brightnessctl
    pulseaudio
  ];

  services.playerctld.enable = true;
  services.mako.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
  };

  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      cursor_inactive_timeout = 4;
      "col.active_border" = "0xff${config.colorscheme.colors.base0B}";
      "col.inactive_border" = "0xff${config.colorscheme.colors.base02}";
    };

    group = {
      "col.border_active" = "0xff${config.colorscheme.colors.base0A}";
      "col.border_inactive" = "0xff${config.colorscheme.colors.base04}";
      groupbar = {
        font_size = 11;
      };
    };

    input = {
      kb_layout = "fr,ara";
      kb_options =  "grp:win_space_toggle";
      repeat_delay = 300;
      numlock_by_default = true;
      follow_mouse = true;
      sensitivity = 0.8;
      accel_profile = "adaptive";
      touchpad.disable_while_typing = false;
      touchpad.natural_scroll = true;
    };

    dwindle.split_width_multiplier = 1.35;

    misc = {
      vfr = true;
      close_special_on_empty = true;
      disable_hyprland_logo = true;
      # Unfullscreen when opening something
      new_window_takes_over_fullscreen = 2;
    };
    
    master = {
      new_is_master = true;
    };
    
    windowrule = "float,^(alacritty)$";

    layerrule = [
      "blur, waybar"
      "ignorezero, waybar"
    ];

    # blurls = [
    #   "waybar"
    # ];

    decoration = {
      active_opacity = 0.94;
      inactive_opacity = 0.75;
      fullscreen_opacity = 1.0;
      rounding = 5;
      
      blur = {
        enabled = true;
        size = 5;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = true;
      };

      drop_shadow = true;
      shadow_range = 12;
      shadow_offset = "3 3";
      "col.shadow" = "0x44000000";
      "col.shadow_inactive" = "0x66000000";
    };

    animations = {
      enabled = true;
      bezier = [
        "easein,0.11, 0, 0.5, 0"
        "easeout,0.5, 1, 0.89, 1"
        "easeinback,0.36, 0, 0.66, -0.56"
        "easeoutback,0.34, 1.56, 0.64, 1"
      ];

      animation = [
        "windowsIn,1,3,easeoutback,slide"
        "windowsOut,1,3,easeinback,slide"
        "windowsMove,1,3,easeoutback"
        "workspaces,1,2,easeoutback,slide"
        "fadeIn,1,3,easeout"
        "fadeOut,1,3,easein"
        "fadeSwitch,1,3,easeout"
        "fadeShadow,1,3,easeout"
        "fadeDim,1,3,easeout"
        "border,1,3,easeout"
      ];
    };

    bind = let
      swww = "${config.programs.swww.package}/bin/swww";
      swaylock = "${config.programs.swaylock.package}/bin/swaylock";
      playerctl = "${config.services.playerctld.package}/bin/playerctl";
      playerctld = "${config.services.playerctld.package}/bin/playerctld";
      makoctl = "${config.services.mako.package}/bin/makoctl";
      wofi = "${config.programs.wofi.package}/bin/wofi";
      pass-wofi = "${pkgs.pass-wofi.override {
        pass = config.programs.password-store.package;
      }}/bin/pass-wofi";

      # grimblast = "${pkgs.inputs.hyprwm-contrib.grimblast}/bin/grimblast";
      pactl = "${pkgs.pulseaudio}/bin/pactl";
      # tly = "${pkgs.tly}/bin/tly";
      gtk-play = "${pkgs.libcanberra-gtk3}/bin/canberra-gtk-play";
      notify-send = "${pkgs.libnotify}/bin/notify-send";

      gtk-launch = "${pkgs.gtk3}/bin/gtk-launch";
      xdg-mime = "${pkgs.xdg-utils}/bin/xdg-mime";
      defaultApp = type: "${gtk-launch} $(${xdg-mime} query default ${type})";

      terminal = config.home.sessionVariables.TERMINAL;
      browser = defaultApp "x-scheme-handler/https";
      editor = defaultApp "text/plain";
      file-manager = "${pkgs.xfce.thunar}/bin/thunar";

      workspaces = [
        { key = "KP_End"; name = "1"; }
        { key = "KP_Down"; name = "2"; }
        { key = "KP_Next"; name = "3"; }
        { key = "KP_Left"; name = "4"; }
        { key = "KP_Begin"; name = "5"; }
        { key = "KP_Right"; name = "6"; }
        { key = "KP_Home"; name = "7"; }
        { key = "KP_Up"; name = "8"; }
        { key = "KP_Prior"; name = "9"; }
        { key = "KP_Insert"; name = "10"; }
      ];
      # Map keys (arrows and hjkl) to hyprland directions (l, r, u, d)
      directions = rec {
        left = "l"; right = "r"; up = "u"; down = "d";
        h = left; l = right; k = up; j = down;
      };
    in [
      "SUPERSHIFT, q, exit"
      "SUPER, q, killactive"
      "SUPER, s, togglesplit"
      "SUPER, f, fullscreen, 1"
      "SUPERSHIFT, f, fullscreen, 0"
      "SUPERSHIFT, space, togglefloating"
      "SUPER, j, togglesplit"

      "SUPER, KP_Subtract, splitratio, -0.25"
      "SUPERSHIFT, KP_Subtract, splitratio, -0.3333333"

      "SUPER, KP_Add, splitratio, 0.25"
      "SUPERSHIFT, KP_Add, splitratio, 0.3333333"

      "SUPER, g, togglegroup"
      "SUPER, t, lockactivegroup, toggle"
      "SUPER, KP_Multiply, changegroupactive, f"
      "SUPERSHIFT, KP_Multiply, changegroupactive, b"

      "SUPER, u, togglespecialworkspace"
      "SUPERSHIFT, u, movetoworkspacesilent, special"

      "SUPERCONTROL, right, workspace, e+1"
      "SUPERCONTROL, left, workspace, e-1"

      # Program bindings
      "SUPER, Return, exec, ${terminal}"
      "SUPER, c, exec, ${editor}"
      "SUPER, b, exec, ${browser}"
      "SUPER, e, exec, ${file-manager}"
    
      # Brightness control (only works if the system has lightd)
      ",XF86MonBrightnessUp, exec, brightnessctl -q s +10%"
      ",XF86MonBrightnessDown, exec, brightnessctl -q s 10%-"
      # Volume
      ",XF86AudioRaiseVolume, exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
      ",XF86AudioLowerVolume, exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
      ",XF86AudioMute, exec, ${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
      "SHIFT,XF86AudioMute, exec, ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
      ",XF86AudioMicMute, exec, ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
      # Screenshotting
      # ",Print,exec,${grimblast} --notify --freeze copy output"
      # "SHIFT,Print,exec,${grimblast} --notify --freeze copy active"
      # "CONTROL,Print,exec,${grimblast} --notify --freeze copy screen"
      # "SUPER,Print,exec,${grimblast} --notify --freeze copy area"
      # "ALT,Print,exec,${grimblast} --notify --freeze copy area"
      # Tally counter
      # "SUPER,z,exec,${notify-send} -t 1000 $(${tly} time) && ${tly} add && ${gtk-play} -i dialog-information" # Add new entry
      # "SUPERCONTROL,z,exec,${notify-send} -t 1000 $(${tly} time) && ${tly} undo && ${gtk-play} -i dialog-warning" # Undo last entry
      # "SUPERCONTROLSHIFT,z,exec,${tly} reset && ${gtk-play} -i complete" # Reset
      # "SUPERSHIFT,z,exec,${notify-send} -t 1000 $(${tly} time)" # Show current time
    ] ++

    (lib.optionals config.services.playerctld.enable [
      # Media control
      ",XF86AudioNext, exec, ${playerctl} next"
      ",XF86AudioPrev, exec, ${playerctl} previous"
      ",XF86AudioPlay, exec, ${playerctl} play-pause"
      ",XF86AudioStop, exec, ${playerctl} stop"
      "ALT,XF86AudioNext, exec, ${playerctld} shift"
      "ALT,XF86AudioPrev, exec, ${playerctld} unshift"
      "ALT,XF86AudioPlay, exec, systemctl --user restart playerctld"
    ]) ++
    # Screen lock
    (lib.optionals config.programs.swaylock.enable [
      "SUPERSHIFT, l, exec, ${swaylock} -S --grace 2"
      ",XF86Lock , exec, ${swaylock} -S --grace 2"
    ]) ++
    # Notification manager
    (lib.optionals config.services.mako.enable [
      "SUPER, w, exec, ${makoctl} dismiss"
    ]) ++

    # Launcher
    (lib.optionals config.programs.wofi.enable [
      "SUPER, x, exec, ${wofi} -S drun -x 10 -y 10 -W 25% -H 60%"
      "SUPER, d, exec, ${wofi} -S run"
    ] ++ (lib.optionals config.programs.password-store.enable [
      ",Scroll_Lock, exec, ${pass-wofi}" # fn+k
      ",XF86Calculator, exec, ${pass-wofi}" # fn+f12
      "SUPER, semicolon, exec, pass-wofi"
    ]))  ++
    # Change workspace
    (map (n:
      "SUPER,${n.key},workspace,name:${n.name}"
    ) workspaces) ++
    # Move window to workspace
    (map (n:
      "SUPERSHIFT,${n.key},movetoworkspacesilent,name:${n.name}"
    ) workspaces) ++
    # Move focus
    (lib.mapAttrsToList (key: direction:
      "SUPER,${key},movefocus,${direction}"
    ) directions) ++
    # Swap windows
    (lib.mapAttrsToList (key: direction:
      "SUPERSHIFT,${key},swapwindow,${direction}"
    ) directions) ++
    # Move windows
    (lib.mapAttrsToList (key: direction:
      "SUPERCONTROL,${key},movewindoworgroup,${direction}"
    ) directions) ++
    # Move monitor focus
    (lib.mapAttrsToList (key: direction:
      "SUPERALT,${key},focusmonitor,${direction}"
    ) directions) ++
    # Move workspace to other monitor
    (lib.mapAttrsToList (key: direction:
      "SUPERALTSHIFT,${key},movecurrentworkspacetomonitor,${direction}"
    ) directions);

    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];
  };

  wayland.windowManager.hyprland.extraConfig = ''
    exec-once = swww query || swww init
    exec-once = ~/.config/hypr/scripts/wallpaper.sh init
  '';

  home.file = {
    ".config/hypr/scripts/wallpaper.sh".source = ./scripts/wallpaper.sh;
  };
}
