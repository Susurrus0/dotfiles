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
              "active" = "";
              "default" = "";
          };
          "persistent-workspaces" = {
              # "*" = 5; # 5 workspaces by default on every monitor
              "eDP-1" = 5; # 5 workspaces specifically on built-in monitor
              # "HDMI-A-1" = 3; # but only three on HDMI-A-1
          };
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
          "format-wifi" = "{essid} ({signalStrength}%) ";
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
          "format" = "{}% ";
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
          "format" = "{capacity}% {icon}";
          "format-icons" = ["" "" "" "" ""];
        };
        "clock" = {
          "interval" = 60;
          "format" = "{:%I:%M %p }";
          };
        };
      };
    style =''
      * {
        border: none;
        border-radius: 0;
        font-family: Source Code Pro;
      }
      window#waybar {
        background: #16191C;
        color: #AAB2BF;
      }
      #workspaces button {
        padding: 0 5px;
      }
    '';
  };
}
