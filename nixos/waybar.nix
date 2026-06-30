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
        spacing = 12;
        modules-left = [ "hyprland/workspaces" "wlr/taskbar" "hyprland/window" ];
        modules-center = [  ];
        modules-right = [ "pulseaudio" "backlight" "network" "mpd" "cpu" "temperature" "memory" "keyboard-state" "group/tray-drawer" "battery" "clock" "custom/power" ];
        "hyprland/workspaces" = {
          "format" = "{name}: {icon}";
          "format-icons" = {
              "1" = "";
              "2" = "󰖟";
              "3" = "";
              "4" = "";
              "5" = "";
              "6" = "";
              "7" = "";
              "8" = "";
              "9" = "";
              "10" = "";
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
          "ignore-list" = [ "foot" "kitty" ];
        };
        "hyprland/window" = {
          "max-length" = 40;
          "separate-outputs" = true;
        };
        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-bluetooth" = "{volume}% {icon}";
          "format-muted" = "";
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
          "format-icons" = ["󰃞" "󰃟" "󰃠"];
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
          "states" = {
            "high" = 90;
          };
        };
        "temperature" = {
          # "thermal-zone": 2,
          # "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
          "critical-threshold" = 80;
          "interval" = 5;
          "format-critical" = "{temperatureC}°C 󱗗";
          "format" = "{temperatureC}°C ";
        };
        "memory" = {
          "interval" = 30;
          "format" = "{}% ";
          "max-length" = 10;
          "states" = {
            "medium" = 50;
            "high" = 90;
          };
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
        "group/tray-drawer" = {
          "orientation" = "horizontal";
          "drawer" = {
            "transition-duration" = 500;
            "children-class" = "tray-child";
            "transition-left-to-right" = false;
          };
          "modules" = [
            "custom/tray-icon"
            "tray"
          ];
        };
        "custom/tray-icon" = {
          "format" = "  ";
          "tooltip" = false;
        };
        "tray" = {
          "icon-size" = 16;
          "spacing" = 10;
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
        "custom/power" = {
          "format" = "⏻";
          "on-click" = "wlogout";
          "tooltip" = false;
        };
        };
      };
    style =''
      * {
        border: none;
        border-radius: 0;
        /* Multiple font fallbacks to fix icon truncation */
        font-family: "Source Code Pro", "Symbols Nerd Font", "Font Awesome 6 Free", sans-serif;
        font-size: 14px;
      }

      window#waybar {
        background: rgba(48, 52, 70, 0.80); /* Catppuccin Frappé Base @ 80% opacity */
        color: #c6d0f5; /* Frappé Text */
        border-bottom: 2px solid #414559; /* Frappé Surface0 line */
      }

      /* Power button*/
      #custom-power {
        padding: 0 12px 0 6px;
        font-size: 16px;
      }
      #custom-power:hover {
        background-color: #e78284;
        color: #303446;
        border-radius: 4px;
        margin: 2px 0;
      }

      /* Unified spacing and extra padding on the right to prevent cutoffs */
      #workspaces, #taskbar, #pulseaudio, #backlight, #network, #mpd, #cpu, #temperature, #memory, #keyboard-state, #battery, #clock, #window {
        padding: 0 10px;
        color: #c6d0f5;
      }

      /* Active / Inactive Workspaces */
      #workspaces button {
        padding: 0 10px;
        margin: 3px 3px;
        color: #737994;
        border-radius: 6px;
      }
      #workspaces button.active {
        color: #303446;
        background-color: #ca9ee6;
      }
      #workspaces button.urgent {
        color: #e78284;
      }

      /* Window Title Styling */
      #window {
        color: #a5adce;
        font-style: italic;
      }

      /* FANCY DYNAMIC EFFECTS */

      /* Battery Warn & Critical states */
      #battery.warning {
        color: #ef9f76;
      }
      #battery.charging {
        color: #a6d189;
      }
      #battery.critical, #battery.charging.critical {
        background-color: #e78284;
        color: #303446;
        border-radius: 4px;
        padding: 0 6px;
        margin: 2px 0;
      }

      /* Keyboard State (Caps Lock Toggled) */
      #keyboard-state label.locked {
        background-color: #8caaee;
        color: #303446;
        border-radius: 4px;
        padding: 0 6px;
        margin: 2px 0;
      }

      /* High CPU usage, Temp, Memory usage*/
      #memory.medium {
        color: #e5c890;
      }
      #memory.high {
        color: #e78284;
      }
      #temperature.critical {
        color: #e78284;
      }
      #cpu.high {
        color: #e78284;
      }

      /* Pulseaudio Mute */
      #pulseaudio.muted {
        background-color: #ef9f76;
        color: #303446;
        border-radius: 4px;
        padding: 0 10px 0 6px;
        margin: 2px 0;
      }
    '';
  };
}
