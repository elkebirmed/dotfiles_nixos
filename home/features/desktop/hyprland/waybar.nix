{ config, pkgs, lib, outputs, inputs, ... }:
let
  systemctl = "${pkgs.systemd}/bin/systemctl";
  pavucontrol = "${pkgs.pavucontrol}/bin/pavucontrol";
  wofi = "${pkgs.wofi}/bin/wofi";

  hasHyprland = config.wayland.windowManager.hyprland.enable;

  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-storm;
  colors = colorScheme.colors;
in
{
  systemd.user.services.waybar = {
    Unit.StartLimitBurst = 30;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      primary = {
        mode = "dock";
        layer = "top";
        height = 30;
        spacing = 4;
        margin = "5px 0 0 3px";
        position = "top";
        passthrough = true;
        
        modules-left = (lib.optionals hasHyprland [
          "hyprland/workspaces"
          "hyprland/window"
        ]);

        modules-right = [
          "tray"
          "idle_inhibitor"
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "hyprland/language"
          "battery"
          "clock"
          "custom/hostname"
        ];

        battery = {
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%d-%m-%Y}";
        };
        
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };

        memory = {
          format = "{}% ";
        };

        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
        };

        backlight = {
          format = "{percent}% {icon}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };

        network = {
          # format-wifi = "{essid} ({signalStrength}%) ";
          format-wifi = "({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };

        "hyprland/language" = {
          format = "{}";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "  0%";
          format-icons = {
            headphone = "󰋋";
            headset = "󰋎";
            portable = "";
            default = [ "" "" "" ];
          };
          on-click = pavucontrol;
        };
        
        "custom/hostname" = {
          exec = "echo $USER";
          on-click = "${systemctl} --user restart waybar";
        };
      };
    };

    style = /* css */ ''
      * {
        font-family: 'JetBrainsMono Nerd Font';
        font-size: 11pt;
      }

      .modules-left {
        margin-left: 10px;
      }

      .modules-right {
        margin-right: 10px;
        margin-left: 10px;
        border: 1px solid #${colors.base0A};
        border-radius: 10px;
        padding: 0 10px;
      }

      .modules-right * {
        padding-left: 10px;
      }
      
      #waybar {
        opacity: 0.85;
        background-color: transparent;
        color: #${colors.base05};
      }

      #workspaces {
        background-color: transparent;
        margin-right: 10px;
      }

      #workspaces button {
        border: 1px solid #${colors.base0A};
        border-radius: 100%;
        background-color: #${colors.base01};
        color: #${colors.base05};
        padding: 0 5px;
        margin-right: 5px;
      }

      #workspaces button:last-child {
        margin-right: 0;
      }

      #workspaces button.hidden {
        background-color: #${colors.base01};
        color: #${colors.base04};
      }

      #workspaces button.focused,
      #workspaces button.active {
        background-color: #${colors.base0A};
        color: #${colors.base01};
      }

      #window {
        border: 1px solid #${colors.base0A};
        border-radius: 10px;
        padding: 0 10px;
      }

      #idle_inhibitor,
      #pulseaudio,
      #memory,
      #temperature,
      #clock,
      #custom-hostname {
        min-width: 20px;
      }

      #cpu {
        min-width: 45px;
      }

      #backlight {
        min-width: 60px;
      }

      #battery {
        min-width: 70px;
      }

      #network {
        min-width: 80px;
      }

      #custom-hostname {
        color: #${colors.base0A};
      }

      #network.disconnected,
      #pulseaudio.muted {
        color: #${colors.base03};
      }

      #battery.charging, #battery.plugged {
        color: #${colors.base0B};
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }

      #battery.critical:not(.charging) {
        background-color: #${colors.base0F};
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
    '';
  };
}
