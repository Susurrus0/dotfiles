{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings =
    {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        spacing = 18;
        modules-left = [ "hyprland/workspaces" "wlr/taskbar" "hyprland/window" ];
        modules-center = [  ];
        modules-right = [ "pulseaudio" "backlight" "network" "mpd" "cpu" "temperature" "memory" "keyboard-state" "battery" "clock" ];
        "hyprland/workspaces" = {
          "format" = "{name}: {icon}";
          "format-icons" = {
              "1" = "";
              "2" = "";
              "3" = "";
              "4" = "";
              "5" = "";
          };
          "persistent-workspaces" = {
              # "*" = 5; # 5 workspaces by default on every monitor
              "eDP-1" = 5; # 5 workspaces specifically on built-in monitor
              # "HDMI-A-1" = 3; # but only three on HDMI-A-1
          };
        };
        "wlr/taskbar" = {
          "format" = "{icon}";
          "icon-size" = 16;
          "icon-theme" = "Numix-Circle";
          "on-click" = "activate";
          "on-click-middle" = "close";
          "ignore-list" = [ "foot" ];
        };
        "hyprland/window" = {
          "max-length" = 40;
          "separate-outputs" = true;
        };
        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-bluetooth" = "{volume}% {icon}";
          "format-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "phone-muted" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
          };
          "scroll-step" = 1;
          "on-click" = "pavucontrol";
          "ignored-sinks" = ["Easy Effects Sink"];
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "{percent}% {icon}";
          "format-icons" = ["" ""];
        };
        "network" = {
          "interface" = "wlp59s0";
          "format" = "{ifname}";
          "format-wifi" = "({signalStrength}%) ";
          "format-ethernet" = "{ipaddr}/{cidr} 󰊗";
          "format-disconnected" = ""; # An empty format will hide the module.
          "tooltip-format" = "{ifname} via {gwaddr} 󰊗";
          "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
          "tooltip-format-ethernet" = "{ifname} ";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 50;
        };
        "cpu" = {
          "interval" = 5;
          "format" = "{usage}% ";
          "max-length" = 10;
        };
        "temperature" = {
          # "thermal-zone": 2,
          # "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
          "critical-threshold" = 80;
          "interval" = 5;
          "format-critical" = "{temperatureC}°C ";
          "format" = "{temperatureC}°C ";
        };
        "memory" = {
          "interval" = 30;
          "format" = "{}% ";
          "max-length" = 10;
        };
        "keyboard-state" = {
          # "numlock" = true;
          "capslock" = true;
          "format" = {
              # "numlock" = "N {icon}";
              "capslock" = "Caps {icon}";
          };
          "format-icons" = {
              "locked" = "";
              "unlocked" = "";
          };
        };
        "battery" = {
          "states" = {
            "warning" = 20;
            "critical" = 10;
          };
          "format" = "{capacity}% {icon}";
          "format-icons" = ["" "" "" "" ""];
        };
        "clock" = {
          "interval" = 60;
          "format" = "{:%I:%M %p }";
          "tooltip-format" = "{:%A, %B %d, %Y}";
          };
        };
      };
    style =''
      * {
        border: none;
        border-radius: 0;
        /* Multiple font fallbacks to fix icon truncation */
        font-family: "Source Code Pro", "Symbols Nerd Font", "Font Awesome 6 Free", sans-serif;
        font-size: 13px;
      }

      window#waybar {
        background: rgba(48, 52, 70, 0.80); /* Catppuccin Frappé Base @ 80% opacity */
        color: #c6d0f5; /* Frappé Text */
        border-bottom: 2px solid #414559; /* Frappé Surface0 line */
      }

      /* Unified spacing and extra padding on the right to prevent cutoffs */
      #workspaces, #taskbar, #pulseaudio, #backlight, #network, #mpd, #cpu, #temperature, #memory, #keyboard-state, #battery, #clock, #window {
        padding: 0 10px;
        color: #c6d0f5;
      }

      /* Active / Inactive Workspaces */
      #workspaces button {
        padding: 0 5px;
        color: #737994; /* Frappé Overlay0 for inactive */
      }
      #workspaces button.active {
        color: #303446; /* Dark text (Frappé Base) to contrast against the pill */
        background-color: #ca9ee6; /* Frappé Mauve background pill */
        border-radius: 6px;
        margin: 3px 0; /* Keeps the pill neatly framed inside the bar */      }
      #workspaces button.urgent {
        color: #e78284; /* Frappé Red for urgent alerts */
      }

      /* Window Title Styling */
      #window {
        color: #a5adce; /* Frappé Subtext0 */
        font-style: italic;
      }

      /* FANCY DYNAMIC EFFECTS */

      /* Battery Warn & Critical states */
      #battery.warning {
        color: #ef9f76; /* Frappé Peach */
      }
      #battery.critical, #battery.charging.critical {
        color: #e78284; /* Frappé Red */
        font-weight: bold;
      }

      /* Keyboard State (Caps Lock Toggled) */
      #keyboard-state label.locked {
        background-color: #8caaee; /* Frappé Blue Background */
        color: #303446;            /* Dark text (Frappé Base) for readability */
        border-radius: 4px;
        padding: 0 6px;            /* Internal padding for the text */
        margin: 2px 0;
      }
    '';
  };
}
